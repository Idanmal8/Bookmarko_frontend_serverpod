import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

mixin RegisterFormStateMixin {
  final formkey = GlobalKey<FormState>();
  final TextEditingController userFullNameController = TextEditingController();
  final TextEditingController userPhoneNumberController = TextEditingController();
  final TextEditingController userEmailController = TextEditingController();

  void fillFromUser(User user) {
    userFullNameController.text = '${user.firstName} ${user.lastName}';
    userPhoneNumberController.text = user.phone;
    userEmailController.text = user.email;
  }
}