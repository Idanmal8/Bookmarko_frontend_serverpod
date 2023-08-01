import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bookmarko_flutter/componenets/buttons/log_in_button.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late String? phone;

  final TextEditingController myController = TextEditingController();

  @override
  void initState() {
    phone = null;
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    debugPrint('Second text field: ${myController.text}');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/backgrounds/abstract_bookmarko_background.png',
        ),
        Container(
          alignment: Alignment.topCenter,
          margin:
              const EdgeInsets.only(top: 100, bottom: 40, right: 20, left: 20),
          constraints: const BoxConstraints(
            minHeight: double.infinity,
            minWidth: double.infinity,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // Added this line
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 110,
                  ),
                  Text(
                    'Welcome! 👋🏼',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Material(
                          child: IntlPhoneField(
                            controller: myController,
                            dropdownTextStyle:
                                const TextStyle(fontFamily: 'Poppins'),
                            disableLengthCheck: true,
                            autofocus: true,
                            decoration: const InputDecoration(
                              //decoration for Input Field
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'IL',
                          ),
                        ),
                        const SizedBox(height: 20), // Add space
                        LogInButton(
                            buttonText: 'Get code',
                            onPressed: context.read<AuthController>().logIn),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
