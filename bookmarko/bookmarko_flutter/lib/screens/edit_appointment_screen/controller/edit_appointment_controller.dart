import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:flutter/material.dart';

class EditAppointmentController extends ChangeNotifier{
  final ConnectionController _connectionController;

  EditAppointmentController({
    required ConnectionController connectionController,
  })  : _connectionController = connectionController;
    
}