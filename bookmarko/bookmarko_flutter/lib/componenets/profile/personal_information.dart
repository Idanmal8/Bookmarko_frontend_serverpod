import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const PersonalInformationBox();
  }
}

class PersonalInformationBox extends StatelessWidget {
  const PersonalInformationBox({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                informationWrapper('Email', 'Idanmal8@gmail.com'),
                const SizedBox(height: 5),
                informationWrapper('Phone', '+972523067197'),
                const SizedBox(height: 5),
                informationWrapper('Address', 'Dov Hoz 11'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding informationWrapper(title, information) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0), // Add desired padding values
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              information,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
