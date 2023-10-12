import 'package:flutter/material.dart';

class OperatingHours extends StatelessWidget {
  const OperatingHours({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                'Operating hours',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(children: [
                dayCreation('Sunday', '08:00 - 16:00'),
                dayCreation('Monday', '08:00 - 20:00'),
                dayCreation('Tuesday', '08:00 - 17:30'),
                dayCreation('Wednesday', '08:00 - 17:30'),
                dayCreation('Thursday', '08:00 - 18:00'),
                dayCreation('Friday', 'Closed'),
                dayCreation('Saturday', '08:00 - 10:00'),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Padding dayCreation(String day, String hours) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(hours)
          ],
        ));
  }
}
