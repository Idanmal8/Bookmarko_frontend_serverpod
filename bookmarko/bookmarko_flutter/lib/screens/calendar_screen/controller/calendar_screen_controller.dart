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
  List<DateTime> _availableTimes = [];
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
  String _errorMessage = '';

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
  List<DateTime> get availableTimes => [..._availableTimes];
  List<Service> get services => [..._services];
  DateTime get getSelectedHourNewAppointment => selectedHourNewAppointment;
  String get errorMessage => _errorMessage;

  set setErrorMessage(String message) {
    _errorMessage = message;
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

  void setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void setSelectedService(Service? service) {
    selectedService = service;
    notifyListeners();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(selectedDate, day)) {
      selectedDate = day;
      getAppointments(day); // Fetch appointments for the selected day.
      notifyListeners();
    }
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

    selectedService = _services.isNotEmpty ? _services.first : null;

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

    _isLoading = false;
    _initAppointmentList = false;
    notifyListeners();

    return _appointments;
  }

  Future<void> goToCustomerAppointment(
      BuildContext context, Appointment appointment) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) =>
              EditAppointmentScreenInCalendar(appointment: appointment)),
    );
  }

  void updateAvailableTimes() {
    if (selectedDate != getSelectedDate ||
        selectedService != getSelectedService) {
      selectedDate = getSelectedDate;
      selectedService = getSelectedService;
      getAppointmentsForService(selectedDate, selectedService!);
    }
  }

/// !ToDo - Fix this function with this steps:
/// 1. Get the selected day operating hours from the server from the app not in the server again.
/// 2. send it to the endpoint with the operating hours.
/// 3. do the same with appointments that are already booked.
/// 4. send it to the endpoint with the appointments.
/// 5. try making the calculation in the server.
Future<List<DateTime>> getAppointmentsForService(
      DateTime date, Service? service) async {
    _isLoading = true;
    notifyListeners();

    print(date);
    print(service);

    _availableTimes.clear();

    if (selectedService?.serviceDuration == null) {
      _errorMessage = 'Service duration has not been set yet';
      _isLoading = false;
      notifyListeners();
      return [];
    }

    // _availableTimes = await _connectionController.client?.appointments
    //         .getAvailableTimes(business.id ?? 0, selectedDate,
    //             selectedService!.serviceDuration) ??
    //     [];

    _isLoading = false;
    _initAppointmentList = false;
    notifyListeners();

    return _availableTimes;
  }
}
