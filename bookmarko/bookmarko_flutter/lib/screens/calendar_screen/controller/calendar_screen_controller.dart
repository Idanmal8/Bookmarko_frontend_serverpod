import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/screens/edit_appointment_screen/edit_appointment_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalendarController extends ChangeNotifier {
  final ConnectionController _connectionController;
  final Business business;

  DateTime selectedDate = DateTime.now();
  DateTime today = DateTime.now();
  List<Appointment> _appointments = [];
  List<Service> _services = [];
  bool _isLoading = false;
  bool _initAppointmentList = false;
  Service? selectedService;
  DateTime selectedHourNewAppointment = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    0,
    0,
  );

  CalendarController({
    required ConnectionController connectionController,
    required this.business,
  }) : _connectionController = connectionController {
    _init();
  }

  DateTime get getSelectedDate => selectedDate;
  DateTime get getToday => today;
  Service? get getSelectedService => selectedService;
  bool get isLoading => _isLoading;
  bool get initAppointmentList => _initAppointmentList;
  List<Appointment> get appointments => [..._appointments];
  List<Service> get services => [..._services];
  DateTime get getSelectedHourNewAppointment => selectedHourNewAppointment;

  set setSelectedService(Service? service) {
    selectedService = service;
    notifyListeners();
  }

  set setSelectedHourNewAppointment(DateTime date) {
    selectedHourNewAppointment = date;
    notifyListeners();
  }

  set getSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

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
    
    _services = await _connectionController.client?.services
            .getServices(business.id ?? 0) ??
        [];

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
