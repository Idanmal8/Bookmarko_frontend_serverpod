
import 'package:bookmarko_flutter/utils/authentication_key_manager.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:bookmarko_client/bookmarko_client.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class ConnectionController extends ChangeNotifier {
  Client? _client;
  Client? get client => _client;

  ConnectionController() {
    if (kIsWeb) {
      _client = Client('https://localhost:443/',
          authenticationKeyManager: FlutterAuthenticationKeyManager())
        ..connectivityMonitor = FlutterConnectivityMonitor();
      return;
    }
    _client = Client(
        Platform.isAndroid ? 'https://10.0.2.2:443/' : 'https://localhost:443/',
        authenticationKeyManager: FlutterAuthenticationKeyManager())
      ..connectivityMonitor = FlutterConnectivityMonitor();
  }
}