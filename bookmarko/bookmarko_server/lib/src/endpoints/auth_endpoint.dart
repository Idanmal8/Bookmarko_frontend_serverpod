import 'package:bookmarko_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

const _adminUsername = {'phone': '0523067191'};

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
      print('Admin with phone $phone not found');
      final authModel =
          await session.auth.signInUser(1, 'phone', scopes: {Scope.admin});
      return '${authModel.id}:${authModel.key}';
    }
    final userWithPhone = await Business.findSingleRow(session,
        where: (business) => business.phone.equals(phone));
    print(userWithPhone);
    print(phone);
    if (userWithPhone != null) {
      print('User with phone $phone found');
      final authModel =
          (await session.auth.signInUser(userWithPhone.id ?? 0, 'pinCode'));
      return '${authModel.id}:${authModel.key}';
    }
    print('User with phone $phone not found');
    return null;
  }
}
