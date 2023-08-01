import 'package:flutter/material.dart';

class MessegeButton extends StatelessWidget {
  const MessegeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MessageButtonInteractive();
  }
}

class MessageButtonInteractive extends StatefulWidget {
  const MessageButtonInteractive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessageButtonState createState() => _MessageButtonState();
}

class _MessageButtonState extends State<MessageButtonInteractive> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: OutlinedButton(
        onPressed: ()
        {
          // print('Messege button pressed');
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
              color: Color.fromARGB(144, 0, 0, 0), width: 1.0), // Black border
        ),
        child: const Text(
          'Messege',
          style: TextStyle(
              color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
