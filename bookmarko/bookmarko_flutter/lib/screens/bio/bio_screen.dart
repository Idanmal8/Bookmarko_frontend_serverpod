import 'package:flutter/material.dart';

class BioEditScreen extends StatelessWidget {
  final int businessId;

  const BioEditScreen({
    required this.businessId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('BioEditScreen'),
      ),
    );
  }
}
