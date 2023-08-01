import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookmarko_flutter/componenets/buttons/log_in_button.dart';
import 'package:bookmarko_flutter/componenets/buttons/go_back_button.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/backgrounds/abstract_bookmarko_background.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [GoBackButton(onPressed: () {})],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'First step to your new platform 🎉',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Please insert your full name here:'),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your full name',
                    ),
                  ),
                  const SizedBox(height: 20),
                  LogInButton(onPressed: () {}, buttonText: 'Next')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
