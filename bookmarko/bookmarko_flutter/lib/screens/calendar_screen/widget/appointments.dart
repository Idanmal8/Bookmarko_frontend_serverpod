import 'package:bookmarko_flutter/screens/calendar_screen/controller/calendar_screen_controller.dart';
import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Appointments extends StatelessWidget {
  final List<Appointment> appointments;
  final CalendarController appointmentsController;

  const Appointments({
    required this.appointments,
    required this.appointmentsController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TableRow> appointmentRows = [
      // Building the header row
      TableRow(
        children: <Widget>[
          headerCell('שם'),
          headerCell('שעה'),
          headerCell('שירות'),
          headerCell('שילם'),
        ],
      ),
      // Adding a spacer after the header
      spacerRow(),
    ];

    // Building the data rows with spacers in between
    for (var appointment in appointments) {
      appointmentRows.add(buildAppointmentRow(appointment, context));
      appointmentRows.add(spacerRow()); // Add spacer row
    }

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(1.2), // Adjusted space for the first column
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      children: appointmentRows,
    );
  }

  // Helper function to create a spacer row
  TableRow spacerRow() {
    return const TableRow(
      children: [
        TableCell(
          child: SizedBox(height: 10), // The height of the spacer
        ),
        TableCell(
          child: SizedBox(height: 10),
        ),
        TableCell(
          child: SizedBox(height: 10),
        ),
        TableCell(
          child: SizedBox(height: 10),
        ),
      ],
    );
  }

  TableRow buildAppointmentRow(Appointment appointment, BuildContext context) {
    onTap() =>
        appointmentsController.goToCustomerAppointment(context, appointment);

    return TableRow(
      children: <Widget>[
        cell(Text(appointment.userName), onTap),
        cell(Text(DateFormat('HH:mm').format(appointment.appointmentDate)),
            onTap),
        cell(Text(appointment.serviceName), onTap),
        cell(
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            child: appointment.paid
                ? Image.asset('assets/calendar/payments/paid_filled.png')
                : Image.asset('assets/calendar/payments/paid_black.png'),
          ),
          onTap,
        ),
      ],
    );
  }

  TableCell headerCell(String text) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: Container(
        height: 30,
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }

  TableCell cell(Widget child, VoidCallback onTap) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
