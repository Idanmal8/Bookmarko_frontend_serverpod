import 'package:flutter/material.dart';

class ProfileBackgroundBanner extends StatelessWidget {
  final VoidCallback onPressed;
  const ProfileBackgroundBanner({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/backgrounds/backgroundGradient.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
