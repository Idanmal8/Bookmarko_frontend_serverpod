import 'package:bookmarko_customer_app/screens/appointment_screen/controller/appointment_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ChangeNotifierProvider<AppointmentScreenController>(
            create: (_) => AppointmentScreenController(),
            child: Consumer<AppointmentScreenController>(
              builder: (context, controller, _) {
                if (controller.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children: [
                    SearchBar(
                      controller: controller.searchController,
                      elevation: const WidgetStatePropertyAll(1),
                      leading: const Icon(Icons.search),
                    ),
                    const SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.getBusinesses.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(controller.getBusinesses[index]),
                              onTap: () => controller.goToSchedualAnAppointmentScreen(
                                context,
                                controller.getBusinesses[index],
                              )
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
