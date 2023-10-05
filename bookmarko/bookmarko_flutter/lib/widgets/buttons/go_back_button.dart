import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final void Function() onPressed;

  const GoBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: const Icon(Icons.arrow_back_ios_outlined,
          color: Colors.black, size: 25),
    );
  }
}
