import 'package:flutter/material.dart';

final ThemeData bookmarkoTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
      padding:
          MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 50)),
      backgroundColor: MaterialStateProperty.all(Colors.blue),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ),
      ),
    ),
  ),
);
