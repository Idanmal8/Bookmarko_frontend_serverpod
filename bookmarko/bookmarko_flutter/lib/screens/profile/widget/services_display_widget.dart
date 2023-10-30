import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';

class Services extends StatelessWidget {
  final List<Service> services;
  final ProfileController onDelete;

  const Services({
    required this.services,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: services.isEmpty
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(
          children: [
            for (var service in services)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ServiceGeneration(
                    context: context,
                    serviceName: service.serviceName,
                    serviceDuration: service.serviceDuration,
                    servicePrice: service.servicePrice,
                    onDelete: onDelete,
                    serviceId: service.id),
              ),
          ],
        ),
      ),
    );
  }
}

class ServiceGeneration extends StatefulWidget {
  const ServiceGeneration({
    super.key,
    required this.context,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
    required this.onDelete,
    required this.serviceId,
  });

  final BuildContext context;
  final String serviceName;
  final int serviceDuration;
  final double servicePrice;
  final ProfileController onDelete;
  final int? serviceId;

  @override
  State<ServiceGeneration> createState() => _ServiceGenerationState();
}

class _ServiceGenerationState extends State<ServiceGeneration>
    with SingleTickerProviderStateMixin {
  late final AnimationController _slideController;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 0), end: const Offset(-0.2, 0))
        .animate(CurvedAnimation(parent: _slideController, curve: Curves.ease));
    _slideController.addListener(() {
      setState(
          () {}); // This will cause the widget to rebuild when the slideController's value changes
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta! < 0) {
          _slideController.forward();
        } else {
          _slideController.reverse();
        }
      },
      child: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: SizedBox(
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.serviceName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Duration: ${widget.serviceDuration} mins',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        'Price: \$${widget.servicePrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 0,
              bottom: 0,
              right: 0,
              width: MediaQuery.of(context).size.width * 0.2,
              child: _slideController.value >= 0.5
                  ? GestureDetector(
                      onTap: () =>
                          widget.onDelete.deleteService(widget.serviceId ?? 0),
                      child: Container(
                        color: const Color.fromARGB(0, 244, 67, 54),
                        child: const Center(
                          child: Icon(Icons.delete,
                              color: Color.fromARGB(255, 255, 0, 0)),
                        ),
                      ),
                    )
                  : Container() // empty container when trashcan is not visible
              )
        ],
      ),
    );
  }
}
