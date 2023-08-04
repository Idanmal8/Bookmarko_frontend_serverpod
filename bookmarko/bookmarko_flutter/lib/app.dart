import 'package:bookmarko_flutter/screens/log_in/log_in_screen.dart';
// import 'package:bookmarko_flutter/screens/registration/registration_proffesion_page.dart';
import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/controllers/auth_controller.dart';
// import 'package:bookmarko_flutter/screens/log_in/log_in_screen.dart';
import 'package:bookmarko_flutter/screens/nav_bar/nav_bar_widget.dart';
import 'package:provider/provider.dart';
// import 'package:bookmarko/screens/log_in/log_in_screen.dart';
// import 'package:bookmarko_flutter/screens/registration/registration_name_page.dart';

import 'theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController())
      ],
      child: MaterialApp(
        title: 'Idan Demo', //like className in React
        theme: bookmarkoTheme,
        locale: const Locale('he', 'IL'),
        home: Builder(builder: (homeGatewayContext) {
          return homeGatewayContext.watch<AuthController>().isLogged
              ? const NavBar()
              : const LogInScreen();
        }),
      ),
    );
  }
}
