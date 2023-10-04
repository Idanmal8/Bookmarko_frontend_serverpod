import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/widgets/buttons/follow_button.dart';
import 'package:bookmarko_flutter/widgets/buttons/messege_button.dart';
import 'package:bookmarko_flutter/widgets/buttons/options_button.dart';

class BioField extends StatelessWidget {
  const BioField({super.key});

  @override
  Widget build(BuildContext context) {
    return const BioBox();
  }
}

class BioBox extends StatelessWidget {
  const BioBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            const Text(
              'Idan malka',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'barber',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Joined march 2023',
                  style: TextStyle(
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
                const Text(
                  '4.9',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
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
