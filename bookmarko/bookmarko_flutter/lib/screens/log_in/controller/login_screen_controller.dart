import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/screens/registration_screen/registration_screen.dart';

class LoginScreenController extends ChangeNotifier {
  final AuthController authController;

  bool isLoading = false;
  String? _errorMessage;

  final formkey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();

  LoginScreenController({required this.authController});

  String? get errorMessage => _errorMessage == null ? null : '$_errorMessage';

  void onLoginButton() async {
    if (formkey.currentState?.validate() != true) return;

    isLoading = true;
    notifyListeners();

    final response = await authController.login(
      phoneNumberController.text
    );

    _errorMessage = response != true ? 'מספר פלאפון שגוי' : null;
    isLoading = false;
    notifyListeners();
  }

  Future<void> goToSignUpScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RegistrationNamePage()
        ),
    );
  }
}