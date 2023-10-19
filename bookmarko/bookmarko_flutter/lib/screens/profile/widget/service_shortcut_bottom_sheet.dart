import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';

class ServiceShortcutAddition extends StatelessWidget {
  final ProfileController controller;

  const ServiceShortcutAddition({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: controller.formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                textAlign: TextAlign.left,
                                controller: controller.serviceNameController,
                                decoration: const InputDecoration(
                                  hintText: 'Service name',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 114, 114, 114),
                                    fontSize: 14,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 91, 91, 91)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(173, 255, 18, 38)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a service name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField<int>(
                                value: controller.selectedServiceDuration,
                                hint: const Text("Service duration"),
                                items: controller.serviceDurations
                                    .map((int duration) {
                                  return DropdownMenuItem<int>(
                                    value: duration,
                                    child: Text('$duration minutes'),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  controller.selectedServiceDuration = newValue;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Service duration',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 114, 114, 114),
                                    fontSize: 14,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 91, 91, 91)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(173, 255, 18, 38)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                ),
                                validator: (int? value) {
                                  if (value == null) {
                                    return 'Please select a service duration';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                textAlign: TextAlign.left,
                                controller: controller.servicePriceController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                decoration: const InputDecoration(
                                  hintText: 'Service price',
                                  hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 114, 114, 114),
                                    fontSize: 14,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 91, 91, 91)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(173, 255, 18, 38)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(174, 88, 47, 254)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a valid price';
                                  }
                                  if (double.parse(value) < 0) {
                                    return 'Please enter a price larger then 0';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          child: const Text('Add service'),
                          onPressed: () => {
                            controller.addService(),
                            Navigator.pop(context)
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              );
            })
      },
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      label: const Text(
        'Add Service',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
