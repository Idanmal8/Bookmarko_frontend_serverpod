import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  final List<Service> services;

  const Services({
    required this.services,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: services.isEmpty
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(top:12.0, left: 12.0, right: 12.0),
        child: Column(
          children: [
            for (var service in services)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ServiceGeneration(
                    context: context,
                    serviceName: service.serviceName,
                    serviceDuration: service.serviceDuration,
                    servicePrice: service.servicePrice),
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
