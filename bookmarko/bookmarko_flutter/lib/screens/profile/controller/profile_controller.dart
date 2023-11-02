import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/screens/bio/bio_screen.dart';

import 'package:bookmarko_flutter/screens/services_screen/services_edit_screen.dart';
import 'package:bookmarko_flutter/screens/operating_hours_screen/operating_hours_screen.dart';

import 'package:bookmarko_flutter/utils/services_form_mixin.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier with ServicesFormMixin {
  final ConnectionController _connectionController;
  final AuthController _authController;
  final int businessId;

  List<Service> _businessServices;
  List<OperatingHours> _operatingHours;
  bool _isLoading = false;

  ProfileController({
    required AuthController authController,
    required ConnectionController connectionController,
    required this.businessId,
    required List<Service> businessServices,
    required List<OperatingHours> operatingHours,
  })  : _connectionController = connectionController,
        _authController = authController,
        _businessServices = businessServices,
        _operatingHours = operatingHours;

  bool get doneLoading => isLoading == false;
  bool get isLoading => _isLoading;
  List<Service> get businessServices => [..._businessServices];
  List<OperatingHours> get operatingHours => [..._operatingHours];

  set businessServices(List<Service> services) {
    _businessServices = services;
    notifyListeners();
  }

  set operatingHours(List<OperatingHours> hours) {
    _operatingHours = hours;
    notifyListeners();
  }

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    businessServices =
        await _connectionController.client?.services.getServices(businessId) ??
            [];

    operatingHours.clear();

    operatingHours = await _connectionController.client?.operatingHours
            .getHours(businessId) ?? [];


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

  void deleteService(int serviceId) async {
    _isLoading = true;
    notifyListeners();

    await _connectionController.client?.services.removeService(serviceId);

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

  Future<void> goToBioScreen(BuildContext context, Business business) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BioEditScreen(businessId: businessId, business: business)),
    );
  }

  void logOut() async {
    await _authController.logout();
    notifyListeners();
  }
}
