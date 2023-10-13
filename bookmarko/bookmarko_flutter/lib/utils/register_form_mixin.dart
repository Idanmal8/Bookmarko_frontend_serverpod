import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/material.dart';

mixin RegisterFormStateMixin {
  final formkey = GlobalKey<FormState>();
  final TextEditingController userFullNameController = TextEditingController();
  final TextEditingController userPhoneNumberController =
      TextEditingController();
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();
  final TextEditingController userBusinessNameController =
      TextEditingController();

  void fillFromUser(Business businessOwner) {
    userFullNameController.text =
        '${businessOwner.firstName} ${businessOwner.lastName}';
    userPhoneNumberController.text = businessOwner.phone;
    userEmailController.text = businessOwner.email;
    userAddressController.text = businessOwner.address;
    userBusinessNameController.text = businessOwner.businessName;
  }
}
