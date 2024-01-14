import 'package:bookmarko_flutter/controllers/connection_controller.dart';
import 'package:bookmarko_flutter/utils/controller/search_bar_handle.dart';
import 'package:flutter/material.dart';


// Need to add scrolling refresh so if that will happen the new appointments will reload.
// that way the init will not be called more then once.

class CustomerScreenController extends ChangeNotifier with SearchBarHandler {
  final ConnectionController _connectionController;

  CustomerScreenController({
    required ConnectionController connectionController,
  }) : _connectionController = connectionController {
    _init();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> _init() async {
    _isLoading = true;
    notifyListeners();

    initSearchBar();

    _isLoading = false;
    notifyListeners();

    return true;
  }
}
