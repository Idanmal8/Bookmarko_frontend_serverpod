import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const LogInButton(
      {required this.onPressed, super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: GoogleFonts.getFont(
          'Poppins',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
