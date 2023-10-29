import 'package:flutter/material.dart';

mixin OperatingHoursMixin {
  final formkey = GlobalKey<FormState>();

  List<DateTime> get hoursToChoose {
    List<DateTime> times = [];
    DateTime initial = DateTime.utc(
        2000, 1, 1, 0, 0);
    for (int i = 0; i < 48; i++) {
      times.add(initial.add(Duration(minutes: 30 * i)));
    }
    return times;
  }

  DateTime? selectedSundayOpenTime;
  DateTime? selectedSundayCloseTime;
  DateTime? selectedMondayOpenTime;
  DateTime? selectedMondayCloseTime;
  DateTime? selectedTuesdayOpenTime;
  DateTime? selectedTuesdayCloseTime;
  DateTime? selectedWednesdayOpenTime;
  DateTime? selectedWednesdayCloseTime;
  DateTime? selectedThursdayOpenTime;
  DateTime? selectedThursdayCloseTime;
  DateTime? selectedFridayOpenTime;
  DateTime? selectedFridayCloseTime;
  DateTime? selectedSaturdayOpenTime;
  DateTime? selectedSaturdayCloseTime;
}
