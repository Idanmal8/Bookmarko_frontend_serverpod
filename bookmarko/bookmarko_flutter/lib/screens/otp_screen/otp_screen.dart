import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/otp_screen/controller/otp_screen_controller.dart';
import 'package:bookmarko_flutter/screens/otp_screen/widget/otp_form.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/widgets/buttons/go_back_button.dart';

import '../../widgets/buttons/primary_blue_button.dart';

class OtpScreen extends StatelessWidget {
  final User user;
  const OtpScreen({
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) =>
          OtpScreenController(context.read<ConnectionController>())),
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
                Consumer<OtpScreenController>(
                    builder: (context, controller, _) {
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
                              'Enter your code',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'please enter the 4 digit code youve recieved',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          const OtpForm(),
                          const SizedBox(height: 50),
                          PrimaryBlueButton(
                            buttonText: 'Confirm',
                            onPressed: () => controller.goToDashBoard(context),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
