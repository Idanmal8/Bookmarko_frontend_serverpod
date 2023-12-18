import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/calendar_screen/controller/calendar_screen_controller.dart';
import 'package:bookmarko_flutter/screens/calendar_screen/widget/hours_bubble.dart';
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
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: Text('Select a Date: ')),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 238, 238, 240),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CupertinoButton(
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
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(child: Text('Select a Service: ')),
                DropdownButton<Service>(
                  value: controller.services.isNotEmpty
                      ? controller.services[0]
                      : null,
                  underline: Container(),
                  items: controller.services.map((Service service) {
                    return DropdownMenuItem<Service>(
                      value: service,
                      child: Text(service
                          .serviceName), // Assuming 'name' is a property of Service
                    );
                  }).toList(),
                  onChanged: (Service? newValue) {
                    controller.setSelectedService = newValue;
                  },
                  isExpanded: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 8.0, // Horizontal space between chips
              runSpacing: 4.0, // Vertical space between chips
              children: <Widget>[
                HoursBubble(isAvailable: false, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: false, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
                HoursBubble(isAvailable: true, time: DateTime.now(), onPressedSetTime: () {}),
              ]
            ),
          ),
        ],
      )),
    );
  }
}
