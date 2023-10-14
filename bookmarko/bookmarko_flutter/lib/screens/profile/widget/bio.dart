import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/profile/widget/follow_button.dart';
import 'package:bookmarko_flutter/screens/profile/widget/messege_button.dart';
import 'package:bookmarko_flutter/screens/profile/widget/options_button.dart';

class BioField extends StatelessWidget {
  final Business business;

  const BioField({
    required this.business,
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
                  business.joined.toString() ?? '',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/profile/star.png',
                  width: 25,
                  height: 25,
                ),
                const SizedBox(width: 20),
                // const Text(
                //   '4.9',
                //   style: TextStyle(
                //     fontSize: 10,
                //   ),
                // ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FollowButton(),
            MessegeButton(),
            OptionButton(),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'As a kid i followed a dream of becoming a software engineer, now i am a software engineer and i am following a dream of becoming a barber.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
