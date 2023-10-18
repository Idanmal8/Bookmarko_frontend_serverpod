import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

import 'package:bookmarko_flutter/screens/services_screen/services_edit_screen.dart';
import 'package:flutter/material.dart';

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

  Future<void> goToServicesPage(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ServicesEditScreen()),
    );
  }

  void logOut() async {
    await _authController.logout();
    notifyListeners();
  }
}
