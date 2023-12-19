import 'package:flutter/material.dart';

class RegisterButtonLogInScreen extends StatelessWidget {
  final VoidCallback onPressed;
  final Text label;
  const RegisterButtonLogInScreen({
    required this.onPressed,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(200, 50),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 255, 255, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black), // Black borders
          ),
        ),
        elevation: MaterialStateProperty.all<double>(
            2), // Adjusted elevation for subtle shadow
        shadowColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 0, 0, 0)
              .withOpacity(0.2), // Light shadow color
        ),
      ),
      child: Text(
        label.data ?? '',
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
