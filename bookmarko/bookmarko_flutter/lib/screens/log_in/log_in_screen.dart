import 'package:bookmarko_flutter/utils/regex_login_screen.dart';
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
            resizeToAvoidBottomInset: false, // add this line
            body: Consumer<LoginScreenController>(
              builder: (context, controller, _) {
                return Stack(
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
                        physics:
                            const BouncingScrollPhysics(), // Added this line
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
                                    Form(
                                      key: controller.formkey,
                                      child: TextFormField(
                                        controller:
                                            controller.phoneNumberController,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        decoration: const InputDecoration(
                                          counterText: "",
                                          labelText: 'Phone number',
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 10) {
                                            return 'Please enter a valid phone number';
                                          }
                                          if (!RegexLogIn.phoneRegex
                                              .hasMatch(value)) {
                                            return 'Please enter a valid phone number that start with 05';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    if (controller.errorMessage != null) ...[
                                      const SizedBox(height: 10),
                                      Text(
                                        controller.errorMessage ?? '',
                                        style: const TextStyle(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                    const SizedBox(height: 20), // Add space
                                    PrimaryBlueButton(
                                      buttonText: 'Get code',
                                      onPressed: () =>
                                          controller.onLoginButton(),
                                    ),
                                    const SizedBox(height: 20), // Add space
                                    Center(
                                      child: InkWell(
                                        onTap: () => controller
                                            .goToSignUpScreen(context),
                                        child: const Text(
                                          'Not a user? join us here',
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
