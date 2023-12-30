import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointments extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback onTapAppointment;

  const Appointments({
    required this.appointment,
    required this.onTapAppointment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
        tag: appointment.userId,
        child: GestureDetector(
          onTap: onTapAppointment,
          child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 234, 221, 255),
                          shape: BoxShape.circle),
                      child: Text(
                        extractNameForThumbnail(appointment.userName),
                        style: const TextStyle(
                            fontFamily: 'VarelaRound',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 90,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.userName,
                            style: const TextStyle(
                                fontSize: 15,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                          ),
                          Text(
                            appointment.serviceName,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 136, 136, 136)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        DateFormat('kk:mm').format(appointment.appointmentDate),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 98, 0, 255)),
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 25,
                        height: 25,
                        child: Image(
                            image: appointment.paid
                                ? const AssetImage(
                                    'assets/calendar/payments/paid_filled.png')
                                : const AssetImage(
                                    'assets/calendar/payments/paid_black.png')))
                  ],
                ),
              )),
        ));
    // Helper function to create a spacer row
  }

  String extractNameForThumbnail(String name) {
    // Split the name into an array of words
    List<String> words = name.split(' ');

    // Extract the first letter of each word and concatenate them
    String initials = '';
    for (String word in words) {
      if (word.isNotEmpty) {
        initials += word[0];
      }
    }

    // Convert to uppercase if desired
    return initials.toUpperCase();
  }
}
