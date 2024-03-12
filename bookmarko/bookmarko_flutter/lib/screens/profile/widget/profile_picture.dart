import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicture extends StatelessWidget {
  final VoidCallback onPressed;
  final XFile? imageFile;

  const ProfilePicture({
    required this.onPressed,
    required this.imageFile,
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
          child: imageFile != null
              ? ClipOval(
                  child: Image.asset(
                    imageFile?.path ?? '',
                    width: 140,
                    height: 140,
                    fit: BoxFit.fitWidth,
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
