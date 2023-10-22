import 'package:flutter/material.dart';
import 'package:bookmarko_client/bookmarko_client.dart';

import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';

class OperatingHoursWidget extends StatelessWidget {
  final List<OperatingHours> operatingHours;
  final ProfileController controller;

  const OperatingHoursWidget({
    required this.operatingHours,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              child: Text(
                'Operating hours',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                if (operatingHours.isEmpty) ...[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton.icon(
                      onPressed: () => controller.goToOperatingHoursScreen(context),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Add operating hours',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ] else ...[
                  for (var operatingHour in operatingHours)
                    dayCreation(operatingHour.day, operatingHour.openTime,
                        operatingHour.closeTime)
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding dayCreation(String day, DateTime open, DateTime close) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (open.year == 2000)
            const Text('Closed')
          else ...[
            Text(open.toString()),
            const Text(' - '),
            Text(close.toString()),
          ],
        ],
      ),
    );
  }
}
