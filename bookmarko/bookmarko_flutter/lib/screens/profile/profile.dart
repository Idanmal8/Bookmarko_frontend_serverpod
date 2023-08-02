import 'package:flutter/material.dart';
import 'package:bookmarko_flutter/componenets/screens/main_screen_view.dart';
import 'package:bookmarko_flutter/controllers/profile_controller.dart';
// import 'package:bookmarko_flutter/models/badge_model.dart';

import 'package:bookmarko_flutter/componenets/profile/bio.dart';
import 'package:bookmarko_flutter/componenets/profile/personal_information.dart';
import 'package:bookmarko_flutter/componenets/profile/Badges/badge_creation.dart';
import 'package:bookmarko_flutter/componenets/profile/Business_services/services_widget.dart';
import 'package:bookmarko_flutter/componenets/profile/operating_hours/operating_hours.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = context.watch<ProfileController>();
    return MainScreenView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.9,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/backgrounds/backgroundGradient.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4 - 75,
                  left: MediaQuery.of(context).size.width / 2 - 75,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/profile/idan_profile.png',
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const BioBox(),
          const Divider(),
          const PersonalInformation(),
          const Divider(),
          Badges(badgesList: controller.badges),
          const Divider(),
          const Services(),
          const Divider(),
          const OperatingHoursBox(),
        ],
      ),
    );
  }
}
