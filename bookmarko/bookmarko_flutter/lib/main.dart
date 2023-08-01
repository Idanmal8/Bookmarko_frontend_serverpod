import 'package:flutter/material.dart';
import 'package:bookmarko_flutter/app.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  await initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
}
