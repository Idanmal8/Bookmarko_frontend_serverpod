import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfilePicture({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ClipOval(
            child: Image.asset(
              'assets/profile/idan_profile.png',
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
