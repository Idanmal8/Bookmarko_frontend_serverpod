import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookmarko_flutter/widgets/buttons/primary_blue_button.dart';
import 'package:bookmarko_flutter/widgets/buttons/go_back_button.dart';

class RegistrationNamePage extends StatelessWidget {
  const RegistrationNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/backgrounds/abstract_bookmarko_background.png', fit: BoxFit.cover),
          ),
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
                  PrimaryBlueButton(onPressed: () {}, buttonText: 'Next')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
