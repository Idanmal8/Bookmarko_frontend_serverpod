import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/utils/operating_hours_form_mixin.dart';
import 'package:flutter/material.dart';

class OperatingHoursController extends ChangeNotifier with OperatingHoursMixin {
  final ConnectionController _connectionController;
  final int businessId;

  bool _isLoading = false;
  bool _formValidationDays = true;
  bool _formTimeValidation = true;
  List<OperatingHours>? _operatingHours = [];

  // Inside the OperatingHoursController class
  Map<String, bool> dayClosedStatus = {
    'Sunday': false,
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
  };

  OperatingHoursController({
    required ConnectionController connectionController,
    required this.businessId,
  }) : _connectionController = connectionController {
    _init();
  }

  bool get isLoading => _isLoading == false;
  bool get formValidation => _formValidationDays == true;
  bool get formTimeValidation => _formTimeValidation == true;
  List<OperatingHours> get operatingHours => _operatingHours ?? [];

  void setOperatingHours(List<OperatingHours> newHours) {
    _operatingHours = newHours;
    notifyListeners();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    _operatingHours = (await _connectionController.client?.operatingHours
        .getHours(businessId));

    // Initialize dayClosedStatus based on the retrieved operating hours
    for (var hours in _operatingHours ?? []) {
      if (hours.openTime == null && hours.closeTime == null) {
        dayClosedStatus[hours.dayInWeek] = false;
      } else {
        dayClosedStatus[hours.dayInWeek] = true;
        updateOpenTimeForDay(hours.openTime, hours.dayInWeek);
        updateCloseTimeForDay(hours.closeTime, hours.dayInWeek);
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateOpenTimeForDay(DateTime? time, String selectedDay) {
    switch (selectedDay) {
      case 'Sunday':
        selectedSundayOpenTime = time;
        break;

      case 'Monday':
        selectedMondayOpenTime = time;
        break;

      case 'Tuesday':
        selectedTuesdayOpenTime = time;
        break;

      case 'Wednesday':
        selectedWednesdayOpenTime = time;
        break;

      case 'Thursday':
        selectedThursdayOpenTime = time;
        break;

      case 'Friday':
        selectedFridayOpenTime = time;
        break;

      case 'Saturday':
        selectedSaturdayOpenTime = time;
        break;
    }

    notifyListeners();
  }

  void updateCloseTimeForDay(DateTime? time, String selectedDay) {
    switch (selectedDay) {
      case 'Sunday':
        selectedSundayCloseTime = time;
        break;

      case 'Monday':
        selectedMondayCloseTime = time;
        break;

      case 'Tuesday':
        selectedTuesdayCloseTime = time;
        break;

      case 'Wednesday':
        selectedWednesdayCloseTime = time;
        break;

      case 'Thursday':
        selectedThursdayCloseTime = time;
        break;

      case 'Friday':
        selectedFridayCloseTime = time;
        break;

      case 'Saturday':
        selectedSaturdayCloseTime = time;
        break;
    }

    notifyListeners();
  }

  void toggleClosedStatusForDay(String day) {
    // Toggle the day's status
    dayClosedStatus[day] = !(dayClosedStatus[day] ?? false);

    // If the status is now false (day is closed), set open and close times to null
    if (!(dayClosedStatus[day] ?? true)) {
      updateOpenTimeForDay(null, day);
      updateCloseTimeForDay(null, day);
    }

    notifyListeners();
  }

  bool validateDaysSelected(DateTime? openTime, DateTime? closeTime) {
    return (openTime != null && closeTime == null) ||
            (openTime == null && closeTime != null)
        ? false
        : true;
  }

  bool validateCloseTimeBiggerThenOpenTime(
      DateTime? openTime, DateTime? closeTime) {
    return openTime != null && closeTime != null && closeTime.isAfter(openTime)
        ? true
        : false;
  }

  Future<bool> saveOperatingHours(BuildContext context, int businessId) async {
    _isLoading = true;
    notifyListeners();

    _operatingHours?.clear();

    Map<String, DateTime?> openTimes = {
      'Sunday': selectedSundayOpenTime,
      'Monday': selectedMondayOpenTime,
      'Tuesday': selectedTuesdayOpenTime,
      'Wednesday': selectedWednesdayOpenTime,
      'Thursday': selectedThursdayOpenTime,
      'Friday': selectedFridayOpenTime,
      'Saturday': selectedSaturdayOpenTime,
    };

    Map<String, DateTime?> closeTimes = {
      'Sunday': selectedSundayCloseTime,
      'Monday': selectedMondayCloseTime,
      'Tuesday': selectedTuesdayCloseTime,
      'Wednesday': selectedWednesdayCloseTime,
      'Thursday': selectedThursdayCloseTime,
      'Friday': selectedFridayCloseTime,
      'Saturday': selectedSaturdayCloseTime,
    };

    for (var day in dayClosedStatus.keys) {
      if (!validateDaysSelected(openTimes[day], closeTimes[day])) {
        _formValidationDays = false;
        return _formValidationDays;
      }
      if (!validateCloseTimeBiggerThenOpenTime(
              openTimes[day], closeTimes[day]) &&
          dayClosedStatus[day] != false) {
        _formTimeValidation = false;
        return _formTimeValidation;
      }
      operatingHours.add(OperatingHours(
        businessId: businessId,
        dayInWeek: day,
        openTime: openTimes[day],
        closeTime: closeTimes[day],
      ));
    }

    final response = await _connectionController.client?.operatingHours
            .editHours(operatingHours) ??
        false;

    _isLoading = false;
    notifyListeners();

    if (context.mounted) {
      if (response) {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('שעות שונו בהצלחה')));
      }
    }

    return response;
  }
}
