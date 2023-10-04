import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/screens/log_in/log_in_screen.dart';
// import 'package:bookmarko_flutter/screens/nav_bar/nav_bar_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:bookmarko_flutter/controllers/auth_controller.dart';
import 'package:bookmarko_flutter/controllers/connection_controller.dart';

import 'package:provider/provider.dart';
import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ChangeNotifierProvider(
        create: (context) => ConnectionController(),
        child: Builder(builder: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => AuthController(
                    connectionController: context.read<ConnectionController>()),
              ),
            ],
            child: MaterialApp(
              title: 'Driver Management',
              theme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
                cardTheme: const CardTheme(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', 'US'),
              ],
              locale: const Locale('he', 'IL'),
              home: Consumer<AuthController>(
                builder: (context, controller, child) {
                  return controller.isLogIn
                      ? const LogInScreen()
                      : const LogInScreen();
                },
                child: const LogInScreen(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
