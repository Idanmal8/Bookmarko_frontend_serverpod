import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/models/badge_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

class ProfileController extends ChangeNotifier {
  final ConnectionController _connectionController;
  final User userDetails;

  bool isLoading = false;

  ProfileController({
    required ConnectionController connectionController,
    required this.userDetails,
  }) : _connectionController = connectionController;
}
