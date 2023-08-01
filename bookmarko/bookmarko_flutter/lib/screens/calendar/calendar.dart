import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:bookmarko_flutter/componenets/appointment/appointments.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      selectedDate = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            calendarContent(),
            const SizedBox(height: 20),
            const Appointments(),
            // Add your calendar layout and other widgets here
          ],
        ),
      ),
    );
  }

  Widget calendarContent() {
    return TableCalendar(
      headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      focusedDay: selectedDate,
      firstDay: today,
      lastDay: DateTime.utc(2024, 3, 14),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, selectedDate),
      onDaySelected: _onDaySelected,
    );
  }
}
