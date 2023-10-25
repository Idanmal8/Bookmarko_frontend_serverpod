import 'package:bookmarko_flutter/screens/operating_hours_screen/controller/operating_hours_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/utils/operating_hours_form_mixin.dart';

class OperatingHoursForm extends StatelessWidget {
  final OperatingHoursController controller;

  const OperatingHoursForm({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildDayRow('Sunday', controller.selectedSundayOpenTime,
              controller.selectedSundayCloseTime, controller),
          buildDayRow('Monday', controller.selectedMondayOpenTime,
              controller.selectedMondayCloseTime, controller),
          buildDayRow('Tuesday', controller.selectedTuesdayOpenTime,
              controller.selectedTuesdayCloseTime, controller),
          buildDayRow('Wednesday', controller.selectedWednesdayOpenTime,
              controller.selectedWednesdayCloseTime, controller),
          buildDayRow('Thursday', controller.selectedThursdayOpenTime,
              controller.selectedThursdayCloseTime, controller),
          buildDayRow('Friday', controller.selectedFridayOpenTime,
              controller.selectedFridayCloseTime, controller),
          buildDayRow('Saturday', controller.selectedSaturdayOpenTime,
              controller.selectedSaturdayCloseTime, controller),
        ],
      ),
    );
  }

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Widget buildDayRow(String day, DateTime? openTime, DateTime? closeTime,
      OperatingHoursMixin controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                day,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  // Adjust the font size if necessary
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: DropdownButton<DateTime>(
              value: openTime,
              underline: Container(),
              items: controller.hoursToChoose.map((DateTime time) {
                return DropdownMenuItem<DateTime>(
                  value: time,
                  child: Text(formatTime(time)),
                );
              }).toList(),
              onChanged: controller.updateOpenTimeForDay(day, openTime),
              hint: const Text('Open'),
              isExpanded: false,
            ),
          ),
          Expanded(
            child: DropdownButton<DateTime>(
              value: closeTime,
              underline: Container(),
              items: controller.hoursToChoose.map((DateTime time) {
                return DropdownMenuItem<DateTime>(
                  value: time,
                  child: Text(formatTime(time)),
                );
              }).toList(),
              onChanged: controller.updateCloseTimeForDay(day, openTime),
              hint: const Text('Close'),
              isExpanded: false,
            ),
          ),
          CupertinoSwitch(value: false, onChanged: (value) => {})
        ],
      ),
    );
  }
}
