import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  bool _isLogged = false;

  bool get isLogged => _isLogged;

  void logIn() {
    _isLogged = true;
    notifyListeners();
  }

  void logOut() {
    _isLogged = false;
    notifyListeners();
  }

  String? get userId => '123';
}
