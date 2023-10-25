import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/operating_hours_screen/controller/operating_hours_controller.dart';
import 'package:bookmarko_flutter/screens/operating_hours_screen/widget/operating_hours_form.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

class OperatingHoursScreen extends StatelessWidget {
  const OperatingHoursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OperatingHoursController(
          connectionController: context.read<ConnectionController>()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: const Text(
                'Operating Hours',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Consumer<OperatingHoursController>(
              builder: (context, controller, _) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OperatingHoursForm(controller: controller),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
