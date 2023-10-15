import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class OperatingHoursWidget extends StatelessWidget {
  final List<OperatingHours> operatingHours;

  const OperatingHoursWidget({
    required this.operatingHours,
    super.key,
  });

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
                for (var operatingHour in operatingHours)
                  dayCreation(operatingHour.day, operatingHour.openTime,
                      operatingHour.closeTime)
              ]),
            )
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
