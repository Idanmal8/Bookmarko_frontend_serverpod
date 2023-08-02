import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ServiceGeneration(context: context, serviceName: 'Haircut', serviceDuration: 30, servicePrice: 20.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: ServiceGeneration(context: context, serviceName: 'Haircut + Stash', serviceDuration: 120, servicePrice: 30.0),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ServiceGeneration(context: context, serviceName: 'Oval', serviceDuration: 150, servicePrice: 75.0),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceGeneration extends StatelessWidget {
  const ServiceGeneration({
    super.key,
    required this.context,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
  });

  final BuildContext context;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;

  @override
  Widget build(BuildContext context) {
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
