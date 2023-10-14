import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final VoidCallback onPressed;
  final bool hasImages;

  const ProfilePicture({
    required this.onPressed,
    required this.hasImages,
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
          child: hasImages
              ? ClipOval(
                  child: Image.asset(
                    'assets/profile/idan_profile.png',
                    width: 140,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                )
              : ClipOval(
                  child: Container(
                    alignment: Alignment.center,
                    color: const Color.fromARGB(255, 232, 232, 232),
                    child: const Text(
                      '+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
