import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/calendar_screen/controller/calendar_screen_controller.dart';
import 'package:bookmarko_flutter/screens/calendar_screen/widget/hours_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class SchedualAppointmentBottomSheetForm extends StatefulWidget {
  final CalendarController controller;
  final Function(DateTime) onDateChanged;

  const SchedualAppointmentBottomSheetForm({
    required this.controller,
    required DateTime selectedDate,
    required this.onDateChanged,
    super.key,
  });

  @override
  SchedualAppointmentBottomSheetFormState createState() =>
      SchedualAppointmentBottomSheetFormState();
}

class SchedualAppointmentBottomSheetFormState
    extends State<SchedualAppointmentBottomSheetForm> {
  late DateTime selectedDate;
  Service? selectedService;
  List<DateTime> availableTimes = [
    DateTime(2022, 1, 1, 14, 30),
    DateTime(2022, 1, 1, 15, 0),
    DateTime(2022, 1, 1, 15, 30),
    DateTime(2022, 1, 1, 16, 0),
    DateTime(2022, 1, 1, 16, 30),
    DateTime(2022, 1, 1, 17, 0),
    DateTime(2022, 1, 1, 17, 30),
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = widget.controller.getSelectedDate;
    selectedService = widget.controller.getSelectedService;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              textAlign: TextAlign.left,
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
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 91, 91, 91)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(173, 255, 18, 38)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildDatePicker(context),
            const SizedBox(height: 20),
            _buildServiceDropdown(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: availableTimes.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : Wrap(
                      spacing: 8.0, // Horizontal space between chips
                      runSpacing: 4.0, // Vertical space between chips
                      children: availableTimes.map((DateTime time) {
                        return HoursBubble(
                          isAvailable: true,
                          time: time,
                          onPressedSetTime: () {
                            // Handle time slot selection
                          },
                        );
                      }).toList(),
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Handle form submission
                    },
                    child: const Text('Schedual Appointment', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Padding(
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
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          selectedDate = newDate;
                          widget.controller.setSelectedDate(newDate);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Expanded(child: Text('Select a Service: ')),
          DropdownButton<Service>(
            value: selectedService,
            underline: Container(),
            items: widget.controller.services.map((Service service) {
              return DropdownMenuItem<Service>(
                value: service,
                child: Text(service.serviceName),
              );
            }).toList(),
            onChanged: (Service? newValue) {
              setState(() {
                selectedService = newValue;
                widget.controller.setSelectedService(newValue);
              });
            },
            isExpanded: false,
          )
        ],
      ),
    );
  }
}
