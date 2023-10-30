import 'package:bookmarko_flutter/screens/operating_hours_screen/controller/operating_hours_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OperatingHoursForm extends StatelessWidget {
  final OperatingHoursController controller;
  final int businessId;

  const OperatingHoursForm({
    required this.controller,
    required this.businessId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formkey,
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
          const SizedBox(height: 60),
          if (!controller.formValidation)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Please select both open and close time for each day',
                  style: TextStyle(color: Colors.red)),
            ),
          if(!controller.formTimeValidation)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Open time should be before close time',
                  style: TextStyle(color: Colors.red)),
            ),
          OutlinedButton(
            child: const Text('Confirm', style: TextStyle(color: Colors.black)),
            onPressed: () => {
              controller.saveOperatingHours(context, businessId),
            },
          ),
        ],
      ),
    );
  }

  String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Widget buildDayRow(String day, DateTime? openTime, DateTime? closeTime,
      OperatingHoursController controller) {
    bool isClosed = controller.dayClosedStatus[day] ?? false;
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
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: DropdownButton(
              value: openTime,
              underline: Container(),
              items: controller.hoursToChoose.map((DateTime time) {
                return DropdownMenuItem<DateTime>(
                  value: time,
                  child: Text(formatTime(time)),
                );
              }).toList(),
              onChanged: isClosed
                  ? (DateTime? newValue) {
                      controller.updateOpenTimeForDay(newValue, day);
                    }
                  : null,
              hint: const Text('Open'),
              isExpanded: false,
            ),
          ),
          Expanded(
            child: DropdownButton(
              value: closeTime,
              underline: Container(),
              items: controller.hoursToChoose.map((DateTime time) {
                return DropdownMenuItem<DateTime>(
                  value: time,
                  child: Text(formatTime(time)),
                );
              }).toList(),
              onChanged: isClosed
                  ? (DateTime? newValue) {
                      controller.updateCloseTimeForDay(newValue, day);
                    }
                  : null,
              hint: const Text('Close'),
              isExpanded: false,
            ),
          ),
          CupertinoSwitch(
            value: isClosed,
            onChanged: (value) {
              controller.toggleClosedStatusForDay(day);
            },
          ),
        ],
      ),
    );
  }
}
