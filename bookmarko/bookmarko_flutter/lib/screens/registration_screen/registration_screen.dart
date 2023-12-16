import 'package:bookmarko_flutter/screens/registration_screen/controller/registration_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/widgets/buttons/primary_blue_button.dart';
import 'package:bookmarko_flutter/widgets/buttons/go_back_button.dart';

import 'package:bookmarko_flutter/screens/registration_screen/widget/registration_form_widget.dart';

class RegistrationNamePage extends StatelessWidget {
  const RegistrationNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          RegistrationScreenController(context.read<ConnectionController>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                      'assets/backgrounds/abstract_bookmarko_background.png',
                      fit: BoxFit.cover),
                ),
                Consumer<RegistrationScreenController>(
                  builder: (context, controller, _) {
                    final errorMessage = controller.errorMessage;
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GoBackButton(
                                    onPressed: () =>
                                        controller.goToLoginScreen(context))
                              ],
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: Text(
                                'First step to your new platform 🎉',
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            RegistrationForm(
                                controller: context
                                    .read<RegistrationScreenController>()),
                            if (errorMessage != null)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 24,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Text(
                                            errorMessage,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 20),
                            PrimaryBlueButton(
                                onPressed: () =>
                                    controller.onRegisterButton(context),
                                buttonText: 'Next'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
