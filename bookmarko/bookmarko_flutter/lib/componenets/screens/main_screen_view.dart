import 'package:flutter/material.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({required this.child, super.key});

  final Widget child;

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: widget.child,
      ),
    );
  }
}
