import 'package:flutter/foundation.dart';

class RegistrationModel extends ChangeNotifier {
  final String _userName;
  final String _email;
  final String _password;
  final String _proffession;
  final int _phone;
  final String _city;
  final registerationCollection = <String, String>{
    'userName': '',
    'email': '',
    'password': '',
    'proffession': '',
    'phone': '',
    'city': '',
  };

  RegistrationModel(String userName, String email, String password,
      String proffession, int phone, String city)
      : _userName = userName,
        _email = email,
        _password = password,
        _proffession = proffession,
        _phone = phone,
        _city = city;
}
