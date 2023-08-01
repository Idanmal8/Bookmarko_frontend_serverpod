import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppointmentsBoxes();
  }
}

class AppointmentsBoxes extends StatelessWidget {
  const AppointmentsBoxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(2.5),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                height: 30,
                alignment: Alignment.center,
                child: const Text('שם'),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                alignment: Alignment.center,
                child: const Text('שעה'),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                alignment: Alignment.center,
                child: const Text('שירות'),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Container(
                alignment: Alignment.center,
                child: const Text('שילם'),
              ),
            ),
          ],
        ),
        TableRow(children: [
          TableCell(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  width: 0.5,
                ),
                color: const Color.fromARGB(0, 0, 0, 0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        'IM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('Idan Malka'),
                ],
              ),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.center,
              child: const Text('19:00'),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.center,
              child: const Text('תספורת + זקן'),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.center,
              child: ClipOval(
                child: Image.asset(
                  'assets/calendar/payments/paid_black.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ])
      ],
    );
  }
}
