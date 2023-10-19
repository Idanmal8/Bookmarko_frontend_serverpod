import 'package:flutter/material.dart';

mixin ServicesFormMixin {
  final formkey = GlobalKey<FormState>();
  int? selectedServiceDuration;
  List<int> serviceDurations = [5,10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95,100,105,110,115,120,125,130,135,140,145,150,155,165,170,175,180];

  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController serviceDurationController =
      TextEditingController();
  final TextEditingController servicePriceController = TextEditingController();
}
