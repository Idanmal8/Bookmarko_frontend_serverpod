import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/profile/widget/follow_button.dart';
import 'package:bookmarko_flutter/screens/profile/widget/messege_button.dart';
import 'package:bookmarko_flutter/screens/profile/widget/options_button.dart';
import 'package:intl/intl.dart';

class BioField extends StatelessWidget {
  final Business business;
  final ProfileController controller;

  const BioField({
    required this.business,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          children: [
            Text(
              business.businessName ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  business.proffesion ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  DateFormat('yyyy-MM-dd').format(business.joined) ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const FollowButton(),
            const MessegeButton(),
            OptionButton(controller: controller),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          business.bio ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
