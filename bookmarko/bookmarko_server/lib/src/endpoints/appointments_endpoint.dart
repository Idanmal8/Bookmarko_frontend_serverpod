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
}
