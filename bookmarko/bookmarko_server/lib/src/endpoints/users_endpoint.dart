import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class UsersEndpoint extends Endpoint {
  Future<bool> addUser(Session session, User user) async {
    try {
      final checkUser = await User.findSingleRow(session,
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
    final user = await session.db.findById<User>(id);
    if(user == null){
      return false;
    }
    await session.db.deleteRow(user);
    return true;
  }

  Future<bool> editUser(Session session, User user) async {
    final oldUser = await session.db.findById<User>(user.id ?? 0);
    if (oldUser != null && user.id == null) { //check about this.
      return false;
    }
    await session.db.update(user);
    return true;
  }

  Future<User?> getUser(Session session, int id) async {
    return await session.db.findById<User>(id);
  }

}

