import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';

import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final ProfileController controller;
  final Business business;

  const OptionButton({
    required this.controller,
    required this.business,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 100,
        child: OutlinedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      buttonCreation(
                          'Edit profile',
                          const Icon(Icons.person),
                          () => controller.goToBioScreen(context,business)),
                      buttonCreation(
                          'Operating hours', const Icon(Icons.timelapse), () {
                        Navigator.of(context).pop();
                        controller.goToOperatingHoursScreen(context);
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                );
              },
            );
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text('Options',
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget buttonCreation(String label, Icon icon, Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 8.0, vertical: 5.0), // Adjust vertical padding as needed
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          alignment: Alignment.centerLeft,
          backgroundColor: Colors.grey
              .shade100, // Assuming a light grey background similar to the image, adjust as needed
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(icon.icon, color: Colors.black),
            const SizedBox(width: 16.0), // Spacing between icon and text
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0), // Adjust fontSize as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
