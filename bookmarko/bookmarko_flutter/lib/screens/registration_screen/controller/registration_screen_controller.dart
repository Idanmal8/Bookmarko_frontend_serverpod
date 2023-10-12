import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/utils/register_form_mixin.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

class RegistrationScreenController extends ChangeNotifier
    with RegisterFormStateMixin {
  final ConnectionController _connectionController;

  String? _errorMessage;
  bool isLoading = false;

  RegistrationScreenController(ConnectionController connectionController)
      : _connectionController = connectionController;

  String? get errorMessage => _errorMessage == null ? null : '$_errorMessage';

  Future<void> goToLoginScreen(BuildContext context) async {
    Navigator.of(context).pop();
  }

  Future<void> onRegisterButton(BuildContext context) async {
    String firstName = '';
    String lastName = '';

    if (formkey.currentState?.validate() != true) return;

    isLoading = true;
    notifyListeners();

    switch (userFullNameController.text.split(' ').length) {
      case 2:
        firstName = userFullNameController.text.split(' ')[0];
        lastName = userFullNameController.text.split(' ')[1];
        break;

      case 3:
        firstName = userFullNameController.text.split(' ')[0];
        lastName =
            '${userFullNameController.text.split(' ')[1]} ${userFullNameController.text.split(' ')[2]}';
        break;
    }

    final response = await _connectionController.client?.users.addUser(
          User(
            firstName: firstName,
            lastName: lastName,
            phone: userPhoneNumberController.text,
            email: userEmailController.text,
            joined: DateTime.now(),
          ),
        ) ??
        false;

    isLoading = false;
    notifyListeners();

    if (response == false) {
      _errorMessage = 'This email is already in use';
      notifyListeners();
      return;
    }

    if (response) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Welcome 🎉')));
        Navigator.of(context).pop();
      }
    }
  }
}
