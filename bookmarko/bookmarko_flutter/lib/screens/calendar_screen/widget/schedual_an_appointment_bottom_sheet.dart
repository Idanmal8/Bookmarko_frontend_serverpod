import 'package:bookmarko_flutter/screens/calendar_screen/controller/calendar_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class SchedualAppointmentBottomSheetForm extends StatelessWidget {
  final CalendarController controller;
  final DateTime selectedDate;

  const SchedualAppointmentBottomSheetForm({
    required this.controller,
    required this.selectedDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Form(
          child: Column(
        children: [
          TextFormField(
            textAlign: TextAlign.left,
            // controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Please enter customer name',
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromARGB(255, 91, 91, 91)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromARGB(173, 255, 18, 38)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 91, 91, 91),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Select a Date: '),
                  CupertinoButton(
                    child: Text(DateFormat('dd/MM/yyyy').format(selectedDate)),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: CupertinoDatePicker(
                            initialDateTime: selectedDate,
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            showDayOfWeek: true,
                            onDateTimeChanged: (DateTime newDate) {
                              controller.selectedDate = newDate;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  CupertinoButton(
                    child: Text(DateFormat('HH:MM').format(controller.getSelectedHourNewAppointment)), // Display the selected time
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode
                                .time, // Set mode to time
                            initialDateTime: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              0,
                              0,
                            ),
                            use24hFormat:
                                true, // Optional based on your preference
                            onDateTimeChanged: (DateTime newTime) {
                              controller.selectedHourNewAppointment = newTime;
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
