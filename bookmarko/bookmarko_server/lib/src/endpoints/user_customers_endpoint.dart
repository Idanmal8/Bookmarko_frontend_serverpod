import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class UserCustomerEndpoint extends Endpoint {

  Future<bool> addUser(Session session, Customer user) async {
    try {
      final checkUser = await Customer.findSingleRow(session,
          where: (checkUser) =>
              checkUser.email.equals(user.email) |
              checkUser.phone.equals(user.phone));

      if (checkUser != null) {
        return false;
      }

      await session.db.insert(user);
      return true;
    } catch (e) {
      session.log('Error adding user: $e');
      return false;
    }
  }

  Future<bool> removeUser(Session session, int id) async {
    final user = await session.db.findById<Customer>(id);
    if (user == null) {
      return false;
    }
    await session.db.deleteRow(user);
    return true;
  }

  Future<bool> editUser(Session session, Customer user) async {
    final oldUser = await session.db.findById<Customer>(user.id ?? 0);
    if (oldUser != null && user.id == null) {
      //check about this.
      return false;
    }
    await session.db.update(user);
    return true;
  }

  Future<Customer?> getCustomerInformation(Session session, int id) async {
    return await session.db.findById<Customer>(id);
  }

  Future<List<Customer>> getCustomers(Session session, int id) async {
    return await Customer.find(
      session,
      where: (customer) => customer.businessId.equals(id),
    );
  }

  Future<List<Payment?>> getCustomerPayments(Session session, int id) async {
    return await Payment.find(
      session,
      where: (payment) => payment.customerId.equals(id),
    );
  }

  Future<List<Appointment?>> getCustomerAppointments(
      Session session, int id) async {
    return await Appointment.find(
      session,
      where: (appointment) => appointment.customerId.equals(id),
    );
  }
}
