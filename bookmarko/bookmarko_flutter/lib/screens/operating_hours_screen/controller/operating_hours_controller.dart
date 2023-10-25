import 'dart:ffi';

import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/utils/operating_hours_form_mixin.dart';
import 'package:flutter/material.dart';

class OperatingHoursController extends ChangeNotifier with OperatingHoursMixin {
  final ConnectionController _connectionController;

  bool _isLoading = false;
  List<OperatingHours> _operatingHours = [];

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
  }) : _connectionController = connectionController;

  bool get isLoading => _isLoading == false;
  List<OperatingHours> get operatingHours => _operatingHours;

  void updateOpenTimeForDay(DateTime? time, String selectedDay) {
    if (time == null) return;

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
    if (time == null) return;

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
    dayClosedStatus[day] = dayClosedStatus[day] ?? false ? false : true;
    if (dayClosedStatus[day] ?? false) {
      // Set the times to 00:00 if closed
      updateOpenTimeForDay(null, day);
      updateCloseTimeForDay(null, day);
    }
    notifyListeners();
  }

  void saveOperatingHours(int businessId) async {
    _isLoading = true;
    notifyListeners();
    print(dayClosedStatus);
    print(selectedSundayOpenTime);
    print(selectedSundayCloseTime);
    print(selectedMondayOpenTime);
    print(selectedMondayCloseTime);
    print(selectedTuesdayOpenTime);
    print(selectedTuesdayCloseTime);
    print(selectedWednesdayOpenTime);
    print(selectedWednesdayCloseTime);
    print(selectedThursdayOpenTime);
    print(selectedThursdayCloseTime);
    print(selectedFridayOpenTime);
    print(selectedFridayCloseTime);
    print(selectedSaturdayOpenTime);
    print(selectedSaturdayCloseTime);

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
      operatingHours.add(OperatingHours(
        businessId: businessId,
        day: day,
        openTime: openTimes[day],
        closeTime: closeTimes[day],
      ));
    }

    await _connectionController.client?.operatingHours
        .editHours(operatingHours);

    _isLoading = false;
    notifyListeners();
  }
}
