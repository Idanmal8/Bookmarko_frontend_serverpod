import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bookmarko_flutter/screens/nav_bar/controller/nav_bar_controller.dart';
import 'package:bookmarko_flutter/screens/calendar/calendar.dart';
import 'package:bookmarko_flutter/screens/profile/profile.dart';

class NavBarScreen extends StatelessWidget {
  NavBarScreen({
    super.key,
  });

  final analytics = SvgPicture.asset(
    'assets/nav_bar_Assets/analytics.svg',
    width: 22,
    height: 22,
  );

  final customers = SvgPicture.asset(
    'assets/nav_bar_Assets/book-reader.svg',
    width: 22,
    height: 22,
  );

  final calendar = SvgPicture.asset(
    'assets/nav_bar_Assets/calender.svg',
    width: 22,
    height: 22,
  );

  final user = SvgPicture.asset(
    'assets/nav_bar_Assets/User.svg',
    width: 22,
    height: 22,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NavBarController>(
      create: (context) => NavBarController(
        connectionController: context.read<ConnectionController>(),
        authController: context.read<AuthController>(),
      ),
      child: Consumer<NavBarController>(
        builder: (context, controller, _) {
          return Scaffold(
            body: controller.doneLoading
                ? <Widget>[
                    Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: const Text('Page 1'),
                    ),
                    Container(
                      color: Colors.green,
                      alignment: Alignment.center,
                      child: const Text('Page 2'),
                    ),
                    Container(
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text('Page 3'),
                    ),
                    const Calendar(),
                    Profile(
                        operatingHours: controller.businessOperatingHours,
                        business: controller.businessOwner,
                        services: controller.businessServices),
                  ][controller.currentPageIndex]
                : const Center(child: CircularProgressIndicator()),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey, // Color of the border
                    width: 0.5, // Width of the border
                  ),
                ),
              ),
              child: NavigationBar(
                height: 58,
                surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
                selectedIndex: controller.currentPageIndex,
                onDestinationSelected: controller.onDestinationSelected,
                destinations: <Widget>[
                  NavigationDestination(
                    selectedIcon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          controller.selectedColorPurple, BlendMode.srcIn),
                      child: analytics,
                    ),
                    icon: analytics,
                    label: 'Analytics',
                  ),
                  NavigationDestination(
                    selectedIcon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          controller.selectedColorPurple, BlendMode.srcIn),
                      child: customers,
                    ),
                    icon: customers,
                    label: 'Customers',
                  ),
                  NavigationDestination(
                    selectedIcon: SizedBox(
                      child: Icon(
                        Icons.add_box,
                        color: controller.selectedColorPurple,
                      ),
                    ),
                    icon: const Icon(
                      Icons.add_box_outlined,
                      size: 30,
                    ),
                    label: 'schedual',
                  ),
                  NavigationDestination(
                    selectedIcon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          controller.selectedColorPurple, BlendMode.srcIn),
                      child: calendar,
                    ),
                    icon: calendar,
                    label: 'Calendar',
                  ),
                  NavigationDestination(
                    selectedIcon: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          controller.selectedColorPurple, BlendMode.srcIn),
                      child: user,
                    ),
                    icon: user,
                    label: 'User',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
