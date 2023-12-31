import 'package:bookmarko_flutter/screens/bio/controller/bio_screen_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';

import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BioEditScreen extends StatelessWidget {
  final int businessId;
  final Business business;

  const BioEditScreen({
    required this.businessId,
    required this.business,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BioScreenController(
        connectionController: context.read<ConnectionController>(),
        authController: context.read<AuthController>(),
        businessId: businessId,
      ),
      child: Builder(
        builder: (context) {
          return Consumer<BioScreenController>(
            builder: (context, controller, child) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Edit profile'),
                    actions: [
                      TextButton(
                          onPressed: () => {
                                controller.changeProfileInformation(
                                    context, business),
                              },
                          child: const Text('Done',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 46, 112, 255))))
                    ],
                  ),
                  body: controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: Form(
                            key: controller.formkey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      // Label for the text field
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right:
                                                8.0), // Add some spacing between label and text field
                                        child: const Text(
                                          'Name:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: controller.userFullNameController,
                                          textAlign: TextAlign.left,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Full name',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 114, 114, 114),
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      0, 91, 91, 91)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      173, 255, 18, 38)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      // Label for the text field
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right:
                                                8.0), // Add some spacing between label and text field
                                        child: const Text(
                                          'Email:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: controller.userEmailController,
                                          textAlign: TextAlign.left,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your email';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Email',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 114, 114, 114),
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      0, 91, 91, 91)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      173, 255, 18, 38)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      // Label for the text field
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right:
                                                8.0), // Add some spacing between label and text field
                                        child: const Text(
                                          'Business name:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: controller.userBusinessNameController,
                                          textAlign: TextAlign.left,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your business name';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Business name',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 114, 114, 114),
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      0, 91, 91, 91)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      173, 255, 18, 38)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    children: [
                                      // Label for the text field
                                      Container(
                                        margin: const EdgeInsets.only(
                                            right:
                                                8.0), // Add some spacing between label and text field
                                        child: const Text(
                                          'Phone:',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: controller.userPhoneNumberController,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please enter your phone';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Phone',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 114, 114, 114),
                                              fontSize: 14,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      0, 91, 91, 91)),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      173, 255, 18, 38)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      174, 88, 47, 254)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
            },
          );
        },
      ),
    );
  }
}
