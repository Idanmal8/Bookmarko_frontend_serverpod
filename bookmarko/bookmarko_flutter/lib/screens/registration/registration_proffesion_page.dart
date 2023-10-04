import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookmarko_flutter/widgets/buttons/primary_blue_button.dart';
import 'package:bookmarko_flutter/widgets/buttons/go_back_button.dart';
// import 'package:bookmarko_flutter/componenets/Registration/dropdown_button.dart';

class ProffesionRegistrationPage extends StatelessWidget {
  final List<String> professionList = [
    'Doctor',
    'Engineer',
    'Teacher',
    'Artist'
  ];

  ProffesionRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
                'assets/backgrounds/abstract_bookmarko_background.png',
                fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [GoBackButton(onPressed: () {})],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Half way there! 👉🏼',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Please choose your proffesion here:'),
                  const SizedBox(height: 20),
                  PopupMenuButton(
                      position: PopupMenuPosition.under,
                      initialValue: professionList[0],
                      child: Text(professionList[0]),
                      itemBuilder: (_) => professionList
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                  const SizedBox(height: 20),
                  PrimaryBlueButton(onPressed: () {}, buttonText: 'Next')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
