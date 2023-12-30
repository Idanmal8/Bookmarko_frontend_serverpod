import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditAppointmentScreenInCalendar extends StatelessWidget {
  final Appointment appointment;

  const EditAppointmentScreenInCalendar({
    required this.appointment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 221, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 221, 255),
        actions: [
          TextButton(
            onPressed: () {},
            child: IconButton(
              color: Colors.black,
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: appointment.userId,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        appointment.userName,
                        style: const TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('d/MM/yyyy kk:mm').format(appointment.appointmentDate),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 98, 0, 255)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
