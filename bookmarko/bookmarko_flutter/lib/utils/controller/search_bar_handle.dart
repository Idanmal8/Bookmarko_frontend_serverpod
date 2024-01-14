import 'package:flutter/material.dart';

/// to use this mixin you must init the searchController in the initSearchBar method
mixin SearchBarHandler on ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  String _fillter = '';

  void initSearchBar() {
    searchController.addListener(() {
      fillter = searchController.text;
    });
  }

  String get fillter => _fillter;
  bool get isFillterOn => _fillter != '';

  set fillter(String value) {
    if (_fillter == value) return;

    _fillter = value;
    notifyListeners();
  }

  bool applyFillter(String value) {
    if (fillter == '') return true;

    return value.contains(_fillter);
  }
}