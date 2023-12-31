import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/screens/nav_bar/nav_bar_screen.dart';

class OtpScreenController extends ChangeNotifier {
  // final ConnectionController _connectionController;

  String? _errorMessage;
  bool isLoading = false;

  OtpScreenController(ConnectionController connectionController);

  String? get errorMessage => _errorMessage == null ? null : '$_errorMessage';

  Future<void> goToLoginScreen(BuildContext context) async {
    Navigator.of(context).pop();
  }

  Future<void> goToDashBoard(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => NavBarScreen()),
    );
  }
}
