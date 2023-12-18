import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/utils/register_form_mixin.dart';

import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

class BioScreenController extends ChangeNotifier with RegisterFormStateMixin {
  final ConnectionController _connectionController;
  final int businessId;

  String? _errorMessage;
  bool _isLoading = false;

  BioScreenController({
    required AuthController authController,
    required ConnectionController connectionController,
    required this.businessId,
  }) : _connectionController = connectionController {
    _init();
  }

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    final businessOwnerInformation = await _connectionController
        .client?.businessOwners
        .getBusiness(businessId);
    if (businessOwnerInformation == null) {
      _errorMessage = 'Failed to load driver information';
      notifyListeners();
      return;
    }

    userFullNameController.text =
        '${businessOwnerInformation.firstName} ${businessOwnerInformation.lastName}';
    userEmailController.text = businessOwnerInformation.email;
    userBusinessNameController.text = businessOwnerInformation.businessName;
    userPhoneNumberController.text = businessOwnerInformation.phone;
    userAddressController.text = businessOwnerInformation.address;

    _isLoading = false;
    notifyListeners();
  }

  Future<bool?> changeProfileInformation(
      BuildContext context, Business business) async {
    if (formkey.currentState?.validate() != true) {
      return false;
    }

    _isLoading = true;
    notifyListeners();
    List<String> fullName = userFullNameController.text.split(' ');

    if (fullName.length <= 1) {
      business.firstName = fullName[0];
      business.lastName = fullName.sublist(1).join(' ');
    } else {
      business.firstName = fullName[0];
      business.lastName = fullName[1];
    }

    business.email = userEmailController.text;
    business.businessName = userBusinessNameController.text;
    business.phone = userPhoneNumberController.text;

    final response = await _connectionController.client?.businessOwners
        .editBusiness(business);

    _isLoading = false;
    notifyListeners();

    if (response == false) {
      _errorMessage = 'Failed to change profile information';
      notifyListeners();
      return false;
    }

    if (context.mounted) {
      FocusManager.instance.primaryFocus?.unfocus();
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Profile information changed successfully')));
    }

    return response;
  }
}
