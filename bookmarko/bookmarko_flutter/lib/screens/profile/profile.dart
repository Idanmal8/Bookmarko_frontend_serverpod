import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/profile/widget/profile_background_banner.dart';
import 'package:bookmarko_flutter/screens/profile/widget/profile_picture.dart';

import 'package:bookmarko_flutter/screens/profile/widget/personal_information.dart';
import 'package:bookmarko_flutter/screens/profile/widget/operating_hours.dart';
import 'package:bookmarko_flutter/screens/profile/widget/services_widget.dart';
import 'package:bookmarko_flutter/screens/profile/widget/bio.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 4 - 75,
                    left: MediaQuery.of(context).size.width / 2 - 75,
                    child: ProfilePicture(
                      onPressed: () => {
                        print("sd2"),
                      },
                    ),
                  ),
                ],
              ),
            ),
            const BioBox(),
            const Divider(),
            const PersonalInformation(),
            const Divider(),
            const Services(),
            const Divider(),
            const OperatingHours(),
          ],
        ),
      ),
    );
  }
}
