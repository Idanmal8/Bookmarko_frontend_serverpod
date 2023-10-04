import 'package:bookmarko_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const _adminUsername = {'phone': '0523067197'};

class AuthEndpoint extends Endpoint {
  Future<bool?> isAdmin(Session session) async {
    return (await session.scopes)?.contains(Scope.admin);
  }

  Future<void> logout(Session session) async {
    await session.auth.signOutUser();
  }

  Future<String?> login(Session session, String phone) async {
    // if admin login
    if (phone == _adminUsername['phone']) {
      final authModel =
          await session.auth.signInUser(-1, 'password', scopes: {Scope.admin});
      return '${authModel.id}:${authModel.key}';
    }

    final userWithPhone = await User.findSingleRow(session,
        where: (user) => user.phone.equals(phone));
    if (userWithPhone != null) {
      final authModel = (await session.auth
          .signInUser(userWithPhone.id ?? 0, 'pinCode'));
      return '${authModel.id}:${authModel.key}';
    }

    return null;
  }
}
