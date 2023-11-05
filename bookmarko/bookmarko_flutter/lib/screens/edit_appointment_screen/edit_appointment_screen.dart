import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class EditAppointmentScreenInCalendar extends StatelessWidget {
  final Appointment appointment;

  const EditAppointmentScreenInCalendar({
    required this.appointment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Center(
        child: Text(appointment.id.toString()),
      ),
    );
  }
}
