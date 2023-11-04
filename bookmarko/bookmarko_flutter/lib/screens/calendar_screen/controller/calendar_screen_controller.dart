import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarController extends ChangeNotifier {
  final ConnectionController _connectionController;
  final AuthController _authController;
  final Business business;

  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();
  List<Appointment> _appointments = [];
  bool _isLoading = false;

  CalendarController({
    required AuthController authController,
    required ConnectionController connectionController,
    required this.business,
  })  : _connectionController = connectionController,
        _authController = authController {
    _init();
  }

  DateTime get getSelectedDate => selectedDate;
  bool get isLoading => _isLoading;
  List<Appointment> get getAppointments => [..._appointments] ;

  set appointmentList(List<Appointment> appointments) {
    _appointments = appointments;
    notifyListeners();
  }

  Future<bool> _init() async {
    _isLoading = true;
    notifyListeners();

    _appointments = await _connectionController.client?.appointments
            .getAppointments(business.id ?? 0, today) ??
        [];
        
    print(_appointments);
    _isLoading = false;
    notifyListeners();

    return true;
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(selectedDate, day)) {
      selectedDate = day;
      notifyListeners();
    }
  }
}
