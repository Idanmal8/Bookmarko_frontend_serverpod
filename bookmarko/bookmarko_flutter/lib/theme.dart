import 'package:flutter/material.dart';

final ThemeData bookmarkoTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
      padding:
          WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 50)),
      backgroundColor: WidgetStateProperty.all(Colors.blue),
      shape: WidgetStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
    ),
  ),
);
