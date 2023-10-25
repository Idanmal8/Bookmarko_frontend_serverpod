import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/utils/operating_hours_form_mixin.dart';
import 'package:flutter/material.dart';

class OperatingHoursController extends ChangeNotifier with OperatingHoursMixin {
  final ConnectionController _connectionController;

  bool _isLoading = false;

  OperatingHoursController({
    required ConnectionController connectionController,
  }) : _connectionController = connectionController;

  bool get isLoading => _isLoading == false;

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

  Future<void> saveOperatingHours() async {
    _isLoading = true;
    notifyListeners();

    _isLoading = false;
    notifyListeners();
  }
}
