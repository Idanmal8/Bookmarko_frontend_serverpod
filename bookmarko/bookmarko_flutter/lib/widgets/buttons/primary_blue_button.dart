import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryBlueButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const PrimaryBlueButton(
      {required this.onPressed, super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 87, 47, 254),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
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
