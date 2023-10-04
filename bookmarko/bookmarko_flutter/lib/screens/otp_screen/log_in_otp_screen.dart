import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookmarko_flutter/widgets/backgrounds/background_widget.dart';
import 'package:bookmarko_flutter/widgets/inputs/digits_catcher.dart';

// ignore: camel_case_types
class Log_in_otp_screen extends StatefulWidget {
  const Log_in_otp_screen({
    super.key,
  });

  @override
  State<Log_in_otp_screen> createState() => _LogInCodeScreen();
}

// ignore: camel_case_types
class _LogInCodeScreen extends State<Log_in_otp_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackgroundWidget(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 110,
                  ),
                  Text(
                    'Please enter the code sent to you via sms',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      roundDigitInput(
                        hintText: '0',
                      ),
                      roundDigitInput(
                        hintText: '0',
                      ),
                      roundDigitInput(
                        hintText: '0',
                      ),
                      roundDigitInput(
                        hintText: '0',
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(20),
                  //   child: LogInButton(buttonText: 'Log-in', phone: 'phone'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
