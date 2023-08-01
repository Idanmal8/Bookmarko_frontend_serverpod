import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class roundDigitInput extends StatelessWidget {
  final String hintText;

  const roundDigitInput({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          constraints: const BoxConstraints(
            maxWidth: 60,
            maxHeight: 60,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: hintText,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1), // Limit input to 1 character
          FilteringTextInputFormatter.digitsOnly,
        ], // Only numbers can be entered
      ),
    );
  }
}
