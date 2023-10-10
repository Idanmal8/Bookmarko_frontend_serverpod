import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class NavBarController extends ChangeNotifier {
  int currentPageIndex = 0;
  final selectedColorPurple = const Color.fromARGB(255, 87, 47, 254);
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  Future<void> onDestinationSelected(int index) async {
    currentPageIndex = index;
    notifyListeners();
  }
}
