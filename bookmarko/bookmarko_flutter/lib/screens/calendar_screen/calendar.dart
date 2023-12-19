import 'package:bookmarko_flutter/screens/calendar_screen/widget/schedual_an_appointment_bottom_sheet.dart';
import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/connection_controller.dart';

import 'package:bookmarko_flutter/screens/calendar_screen/widget/appointments.dart';
import 'package:bookmarko_flutter/screens/calendar_screen/controller/calendar_screen_controller.dart';

class Calendar extends StatelessWidget {
  final Business business;

  const Calendar({
    super.key,
    required this.business,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalendarController>(
      create: (context) => CalendarController(
        connectionController: context.read<ConnectionController>(),
        business: business,
      ),
      child: Builder(
        builder: (context) {
          return Consumer<CalendarController>(
            builder: (context, controller, child) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SchedualAppointmentBottomSheetForm(
                          controller: controller,
                          selectedDate: controller.getSelectedDate,
                          onDateChanged: (newDate) {
                            // Use this callback to update the calendar
                            controller.onDaySelected(newDate, newDate);
                          },
                        );
                      },
                    );
                    controller.getAppointmentsForService(controller.getSelectedDate,
                                controller.getSelectedService);
                  },
                  child: const Icon(Icons.add),
                ),
                body: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TableCalendar(
                          headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                              titleTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          focusedDay: controller.selectedDate,
                          firstDay: controller.today,
                          lastDay: DateTime.utc(2050, 3, 14),
                          availableGestures: AvailableGestures.all,
                          selectedDayPredicate: (day) =>
                              isSameDay(day, controller.selectedDate),
                          onDaySelected:
                              (DateTime selectedDay, DateTime focusedDay) {
                            controller.onDaySelected(selectedDay, focusedDay);
                          },
                        ),
                        const SizedBox(height: 20),
                        if (!controller.isLoading) // Check if not loading
                          Appointments(
                            appointments: controller.appointments,
                            appointmentsController: controller,
                          )
                        else
                          const CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
