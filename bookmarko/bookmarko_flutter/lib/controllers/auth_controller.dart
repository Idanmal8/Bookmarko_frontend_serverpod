import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  ConnectionController connectionController;

  String? _tokenKey;
  bool? _isAdmin;

  AuthController({required this.connectionController});

  String? get tokenKey => _tokenKey;
  bool get isLogIn => _tokenKey != null;

  bool get isAdmin => _isAdmin == true;

  Future<void> logout() async {
    _tokenKey = null;
    _isAdmin = null;
    await connectionController.client?.auth.logout();
    notifyListeners();
  }

  Future<bool> login(String phone) async {
    try {
      if (tokenKey != null) await logout();
      final response = await connectionController.client?.auth.login(phone);
      if (response == null) return false;

      _tokenKey = response;

      await connectionController.client?.authenticationKeyManager
          ?.put(response);

      await connectionController.client
          ?.updateStreamingConnectionAuthenticationKey(response);

      _isAdmin = await connectionController.client?.auth.isAdmin();

      notifyListeners();
      return true;
    } catch (error) {
      print('Error during login: $error');
      return false;
    }
  }
}
