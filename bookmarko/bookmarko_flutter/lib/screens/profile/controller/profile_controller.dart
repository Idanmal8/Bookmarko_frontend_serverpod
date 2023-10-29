import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

import 'package:bookmarko_flutter/screens/services_screen/services_edit_screen.dart';
import 'package:bookmarko_flutter/screens/operating_hours_screen/operating_hours_screen.dart';

import 'package:bookmarko_flutter/utils/services_form_mixin.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier with ServicesFormMixin {
  final ConnectionController _connectionController;
  final AuthController _authController;
  final int businessId;

  List<Service>? _businessServices;
  List<OperatingHours>? _operatingHours;
  bool _isLoading = false;

  ProfileController({
    required AuthController authController,
    required ConnectionController connectionController,
    required this.businessId,
  })  : _connectionController = connectionController,
        _authController = authController {
    _init();
  }

  bool get doneLoading => isLoading == false;
  bool get isLoading => _isLoading;
  List<Service> get businessServices => [..._businessServices ?? []];
  List<OperatingHours> get operatingHours => [..._operatingHours ?? []];

  void setOperatingHours(List<OperatingHours> newHours) {
    _operatingHours = newHours;
    notifyListeners();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    _businessServices = await _connectionController.client?.services.getServices(businessId);

    _operatingHours?.clear();
    
    final hours = await _connectionController.client?.operatingHours.getHours(businessId) ?? [];
    if (_operatingHours == null) {
        _operatingHours = hours;
    } else {
        _operatingHours?.addAll(hours);
    }

    print("This is the new operating hours: $_operatingHours");
    
    _isLoading = false;
    notifyListeners();
}


  Future<void> goToServicesPage(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ServicesEditScreen()),
    );
  }

  void addService() async {
    _isLoading = true;
    notifyListeners();

    await _connectionController.client?.services.addService(
      Service(
        businessId: businessId,
        serviceName: serviceNameController.text,
        serviceDuration: selectedServiceDuration ?? 0,
        servicePrice: double.parse(servicePriceController.text),
      ),
    );

    _init();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> goToOperatingHoursScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => OperatingHoursScreen(businessId: businessId)),
    );

    _init();
  }

  void logOut() async {
    await _authController.logout();
    notifyListeners();
  }
}
