import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HoursBubble extends StatelessWidget {
  final bool isAvailable;
  final DateTime time;
  final VoidCallback onPressedSetTime;

  const HoursBubble({
    required this.isAvailable,
    required this.time,
    required this.onPressedSetTime,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 16)),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey; // Text color when the button is disabled
            }
            return Colors.black; // Text color for all other states
          },
        ),
        
        backgroundColor: isAvailable
            ? MaterialStateProperty.all(const Color.fromARGB(255, 234, 222, 255))
            : MaterialStateProperty.all(const Color.fromARGB(255, 235, 235, 235)),
      ),
      onPressed: isAvailable ? onPressedSetTime : null,
      child: Text(DateFormat('HH:mm').format(time)), // Changed 'MM' to 'mm' for minutes
    );
  }
}
