import 'package:flutter/material.dart';

class BigTextFields extends StatelessWidget {
  final String hintText;

  const BigTextFields({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: const Color.fromARGB(0, 216, 216, 216),
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // This adds a light grey stroke to the box
          ),
        ),
      ),
    );
  }
}
