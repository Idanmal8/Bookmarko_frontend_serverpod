import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/log_in/controller/login_screen_controller.dart';
import 'package:bookmarko_flutter/widgets/buttons/primary_blue_button.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenController>(
      create: (context) =>
          LoginScreenController(authController: context.read<AuthController>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
              body: Stack(
            children: [
              Image.asset(
                'assets/backgrounds/abstract_bookmarko_background.png',
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(
                    top: 100, bottom: 40, right: 20, left: 20),
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
                                  controller: context
                                      .read<LoginScreenController>()
                                      .phoneNumberController,
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
                              PrimaryBlueButton(
                                  buttonText: 'Get code',
                                  onPressed: () =>
                                      {print("Connect")}),
                              const SizedBox(height: 20), // Add space
                              Center(
                                child: InkWell(
                                  onTap: () => {print("Not a user? Sign up")},
                                  child: const Text(
                                    'Not a user? Sign up',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ));
        },
      ),
    );
  }
}
