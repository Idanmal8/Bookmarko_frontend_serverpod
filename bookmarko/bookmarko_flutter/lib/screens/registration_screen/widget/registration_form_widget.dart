import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/utils/register_form_mixin.dart';
import 'package:bookmarko_flutter/utils/regex_registration.dart';

class RegistrationForm extends StatelessWidget {
  final RegisterFormStateMixin controller;

  const RegistrationForm({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              textAlign: TextAlign.left,
              controller: controller.userFullNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                if (!RegexRegistration.userNameShortRegex.hasMatch(value) &&
                    !RegexRegistration.userNameLongRegex.hasMatch(value)) {
                  return 'Please enter a valid name';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Full name',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 91, 91, 91)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(173, 255, 18, 38)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.left,
              maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                if (!RegexRegistration.userPhoneNumberRegex.hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
              controller: controller.userPhoneNumberController,
              decoration: const InputDecoration(
                hintText: 'Phone number',
                counterText: "",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 91, 91, 91)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(173, 255, 18, 38)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.left,
              controller: controller.userEmailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                if (!RegexRegistration.userEmailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 91, 91, 91)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(173, 255, 18, 38)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide:
                      BorderSide(color: Color.fromARGB(174, 88, 47, 254)),
                ),
              ),
            ),
          ],
        ));
  }
}
