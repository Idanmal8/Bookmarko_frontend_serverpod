import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: double.infinity,
              minHeight: double.infinity,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/backgrounds/abstract_bookmarko_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: child,
          ),
        ],
      ),
    );
  }
}
