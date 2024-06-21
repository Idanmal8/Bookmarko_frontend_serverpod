import 'package:bookmarko_customer_app/screens/schedual_an_appointment_screen/schedual_an_appointment_screen.dart';
import 'package:bookmarko_customer_app/utils/search_bar_handler.dart';
import 'package:flutter/material.dart';

class AppointmentScreenController extends ChangeNotifier with SearchBarHandler {
  //generate another String list but of 5 businesses
  final List<String> _businesses = [
    'Edi Barbershop',
    'John Barbershop',
    'Eli Barbershop',
    'Debi Barbershop',
    'Micheal Barbershop'
  ];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String> get getBusinesses {
    if (!isFillterOn) {
      return [..._businesses];
    } else {
      return _businesses.where((element) => applyFillter(element.toLowerCase())).toList();
    }
  }

  AppointmentScreenController(){
    init();
  }

  void init() {
    _isLoading = true;
    notifyListeners();

    initSearchBar();

    _isLoading = false;
    notifyListeners();
  }

  void goToSchedualAnAppointmentScreen(BuildContext context, String businessName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SchedualAnAppointmentScreen(businessName: businessName,),
      ),
    );
  }
}
