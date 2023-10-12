import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/screens/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:bookmarko_flutter/screens/profile/profile.dart';
import 'package:bookmarko_flutter/screens/calendar/calendar.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;
  final selectedColorPurple = const Color.fromARGB(255, 87, 47, 254);

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

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 52,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        labelBehavior: labelBehavior,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(selectedColorPurple, BlendMode.srcIn),
              child: analytics,
            ),
            icon: analytics,
            label: 'Analytics',
          ),
          NavigationDestination(
            selectedIcon: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(selectedColorPurple, BlendMode.srcIn),
              child: customers,
            ),
            icon: customers,
            label: 'Customers',
          ),
          NavigationDestination(
            selectedIcon: SizedBox(
              child: Icon(
                Icons.add_box,
                color: selectedColorPurple,
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
              colorFilter:
                  ColorFilter.mode(selectedColorPurple, BlendMode.srcIn),
              child: calendar,
            ),
            icon: calendar,
            label: 'Calendar',
          ),
          NavigationDestination(
            selectedIcon: ColorFiltered(
              colorFilter:
                  ColorFilter.mode(selectedColorPurple, BlendMode.srcIn),
              child: user,
            ),
            icon: user,
            label: 'User',
          ),
        ],
      ),
      body: <Widget>[
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
        const Profile(),
      ][currentPageIndex],
    );
  }
}
