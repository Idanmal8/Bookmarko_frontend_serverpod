import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/screens/edit_appointment_screen/edit_appointment_screen.dart';
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
  bool _initAppointmentList = false;

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
  bool get initAppointmentList => _initAppointmentList;
  List<Appointment> get appointments => [..._appointments];

  set appointmentList(List<Appointment> appointments) {
    _appointments = appointments;
    notifyListeners();
  }

  Future<bool> _init() async {
    _isLoading = true;
    notifyListeners();

    _appointments.clear();

    _appointments = await _connectionController.client?.appointments
            .getAppointments(business.id ?? 0, today) ??
        [];

    print(_appointments);
    _isLoading = false;
    notifyListeners();

    return true;
  }

  Future<List<Appointment>> getAppointments(DateTime date) async {
    _isLoading = true;
    _initAppointmentList = true;
    notifyListeners();

    _appointments.clear();

    _appointments = await _connectionController.client?.appointments
            .getAppointments(business.id ?? 0, selectedDate) ??
        [];

    print(_appointments);

    _isLoading = false;
    _initAppointmentList = false;
    notifyListeners();

    return _appointments;
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(selectedDate, day)) {
      selectedDate = day;
      getAppointments(day); // Fetch appointments for the selected day.
      notifyListeners();
    }
  }

  Future<void> goToCustomerAppointment(
      BuildContext context, Appointment appointment) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              EditAppointmentScreenInCalendar(appointment: appointment)),
    );
  }
}
