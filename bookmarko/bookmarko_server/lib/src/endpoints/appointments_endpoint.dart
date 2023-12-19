import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class AppointmentsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> addAppointment(Session session, Appointment appointment) async {
    await session.db.insert(appointment);
    return true;
  }

  Future<bool> removeAppointment(Session session, int id) async {
    final appointment = await session.db.findById<Appointment>(id);
    if (appointment == null) {
      return false;
    }
    await session.db.deleteRow(appointment);
    return true;
  }

  Future<bool> editAppointment(Session session, Appointment appointment) async {
    final oldAppointment =
        await session.db.findById<Appointment>(appointment.id ?? 0);
    if (oldAppointment == null) {
      return false;
    }
    await session.db.update(appointment);
    return true;
  }

  Future<List<Appointment>> getAppointments(
      Session session, int businessId, DateTime date) async {
    // Fetch the appointments based on the kindOfAppointment and businessId
    print('businessId: $businessId');

    final appointments = await Appointment.find(session,
        where: (appointment) =>
            (appointment.businessId.equals(businessId)) &
            (appointment.appointmentDate >=
                DateTime(date.year, date.month, date.day)) &
            (appointment.appointmentDate <
                DateTime(date.year, date.month, date.day + 1)));

    print('appointments: $appointments');
    // If no appointments are found, return an empty list
    if (appointments.isEmpty) {
      return [];
    }

    return appointments;
  }

  // Future<List<DateTime>> getAvailableTimes(Session session, int businessId,
  //     DateTime date, int timeFrameBasedOnService) async {

  //   final availableTimes = <DateTime>[];

  //   // Generate time slots
  //   for (DateTime slotTime = startTime;
  //       slotTime.add(timeFrameBasedOnService as Duration).isBefore(endTime);
  //       slotTime = slotTime.add(timeFrameBasedOnService as Duration)) {
  //     bool isSlotAvailable = true;
  //     session.log(
  //       'Oops, something went wrong 4',
  //     );
  //     // Check if slot overlaps with any existing appointments
  //     for (final appointment in appointments) {
  //       DateTime appointmentStart = appointment.appointmentDate;
  //       DateTime appointmentEnd =
  //           appointmentStart.add(timeFrameBasedOnService as Duration);

  //       if (slotTime.isBefore(appointmentEnd) &&
  //           slotTime
  //               .add(timeFrameBasedOnService as Duration)
  //               .isAfter(appointmentStart)) {
  //         isSlotAvailable = false;
  //         break;
  //       }
  //     }

  //     if (isSlotAvailable) {
  //       availableTimes.add(slotTime);
  //     }
  //   }
  //   session.log(
  //     'Oops, something went wrong 5',
  //   );

  //   return availableTimes;
  // }

}
