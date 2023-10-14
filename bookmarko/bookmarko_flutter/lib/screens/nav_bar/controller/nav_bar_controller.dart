import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:flutter/material.dart';

class NavBarController extends ChangeNotifier {
  final selectedColorPurple = const Color.fromARGB(255, 87, 47, 254);
  final ConnectionController _connectionController;
  final AuthController _authController;

  int currentPageIndex = 0;
  Business? _businessDetails;
  List<ImageAsset>? _businessImages;
  List<Service>? _businessServices;
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

  List<ImageAsset> get businessImages {
    final images = _businessImages;

    if (images == null || images.isEmpty) {
      throw Exception('Images list is null or empty');
    }
    return images;
  }

  List<Service> get businessServices {
    final services = _businessServices;

    if (services == null || services.isEmpty) {
      throw Exception('Services list is null or empty');
    }
    return services;
  }

  Future<bool> _init() async {
    _isLoading = true;
    notifyListeners();

    _businessDetails = await _connectionController
        .client?.businessOwnersInformation
        .getBusinessInformation();

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
