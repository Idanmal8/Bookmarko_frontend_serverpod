import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/profile/widget/service_shortcut_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

import 'package:bookmarko_flutter/screens/profile/widget/profile_background_banner.dart';
import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';
import 'package:bookmarko_flutter/screens/profile/widget/personal_information.dart';
import 'package:bookmarko_flutter/screens/profile/widget/operating_hours.dart';
import 'package:bookmarko_flutter/screens/profile/widget/profile_picture.dart';
import 'package:bookmarko_flutter/screens/profile/widget/services_display_widget.dart';
import 'package:bookmarko_flutter/screens/profile/widget/bio.dart';

class Profile extends StatelessWidget {
  final Business business;
  final List<Service> services;
  final List<OperatingHours> operatingHours;

  const Profile({
    required this.operatingHours,
    required this.business,
    required this.services,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileController(
        connectionController: context.read<ConnectionController>(),
        authController: context.read<AuthController>(),
        businessId: business.id ?? 0,
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                business.businessName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Consumer<ProfileController>(
              builder: (context, controller, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.9,
                        child: Stack(
                          children: [
                            ProfileBackgroundBanner(
                              onPressed: () => {
                                print("sd"),
                              },
                              hasBackgroundImage: false,
                              // backgroundImage: 'as',
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 4 - 75,
                              left: MediaQuery.of(context).size.width / 2 - 75,
                              child: ProfilePicture(
                                onPressed: () => {
                                  print("sd2"),
                                },
                                hasImages: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      BioField(business: business, controller: controller),
                      const Divider(),
                      PersonalInformation(business: business),
                      const Divider(),
                      Services(services: controller.businessServices),
                      ServiceShortcutAddition(controller: controller),
                      const Divider(),
                      OperatingHoursWidget(operatingHours: controller.operatingHours, controller: controller,),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
