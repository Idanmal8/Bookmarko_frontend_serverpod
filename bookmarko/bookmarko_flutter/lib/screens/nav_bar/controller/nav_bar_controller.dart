import 'package:flutter/material.dart';
import 'package:bookmarko_client/bookmarko_client.dart';

import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

class NavBarController extends ChangeNotifier {
  final selectedColorPurple = const Color.fromARGB(255, 87, 47, 254);
  final ConnectionController _connectionController;
  final AuthController _authController;

  int currentPageIndex = 0;
  Business? _businessDetails;
  List<ImageAsset>? _businessImages = [];
  List<Service>? _businessServices;
  List<OperatingHours>? _businessOperatingHours;
  List<Customer>? _businessCustomers;

  bool _isLoading = false;

  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysHide;

  NavBarController({
    required AuthController authController,
    required ConnectionController connectionController,
  })  : _connectionController = connectionController,
        _authController = authController {
    _init();
  }

  bool get doneLoading => _businessDetails != null && isLoading == false;
  bool get isLoading => _isLoading;

  Business get businessOwner {
    final business = _businessDetails;

    if (business == null) {
      throw Exception('Business is null');
    }

    return business;
  }

  List<ImageAsset> get businessImages => [..._businessImages ?? []];

  List<Service> get businessServices => [..._businessServices ?? []];

  List<Customer> get businessCustomers => [..._businessCustomers ?? []];

  List<OperatingHours> get businessOperatingHours =>
      [..._businessOperatingHours ?? []];

  Future<bool> _init() async {
    _isLoading = true;
    notifyListeners();

    _businessDetails = await _connectionController
        .client?.businessOwnersInformation
        .getBusinessInformation();

    // _businessImages = await _connectionController.client?.businessAssets
    //     .getAssets(_businessDetails?.id ?? 0);

    _businessOperatingHours = (await _connectionController
        .client?.operatingHours
        .getHours(_businessDetails?.id ?? 0));

    _businessServices = (await _connectionController.client?.services
        .getServices(_businessDetails?.id ?? 0));

    // _businessCustomers = (await _connectionController.client?.userCustomer
    //     .getCustomers(_businessDetails?.id ?? 0));

    if (_businessDetails == null) {
      _isLoading = false;
      notifyListeners();
      return false;
    }

    _isLoading = false;
    notifyListeners();
    return true;
  }

  Future<void> onDestinationSelected(int index) async {
    currentPageIndex = index;
    notifyListeners();
  }

  void logOut() async {
    await _authController.logout();
    notifyListeners();
  }
}
