import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:flutter/foundation.dart';

import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

class ProfileController extends ChangeNotifier {
  final ConnectionController _connectionController;
  final AuthController _authController;

  bool _isLoading = false;

  ProfileController({
    required AuthController authController,
    required ConnectionController connectionController,
  })  : _connectionController = connectionController,
        _authController = authController;

  bool get doneLoading => isLoading == false;
  bool get isLoading => _isLoading;

  void logOut() async {
    await _authController.logout();
    notifyListeners();
  }
}
