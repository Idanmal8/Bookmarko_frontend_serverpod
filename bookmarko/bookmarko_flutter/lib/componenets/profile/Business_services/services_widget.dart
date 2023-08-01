import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServicesBox();
  }
}

class ServicesBox extends StatelessWidget {
  const ServicesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 143, 143, 143),
            width: 0.1,
          ),
        ),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: servicesGeneration(context, 'Haircut', 30, 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: servicesGeneration(context, 'Haircut + Stash', 120, 30.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: servicesGeneration(context, 'Oval', 150, 75.0),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox servicesGeneration(BuildContext context, String serviceName,
      int serviceDuration, double servicePrice) {
    return SizedBox(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.5,
          ),
          color: const Color.fromARGB(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                serviceName,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Duration: $serviceDuration mins',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              Text(
                'Price: \$${servicePrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
