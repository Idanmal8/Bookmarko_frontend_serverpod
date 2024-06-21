import 'package:flutter/material.dart';

class SchedualAnAppointmentScreen extends StatefulWidget {
  final String businessName;

  const SchedualAnAppointmentScreen({
    required this.businessName,
    super.key,
  });

  @override
  _SchedualAnAppointmentScreenState createState() => _SchedualAnAppointmentScreenState();
}

class _SchedualAnAppointmentScreenState extends State<SchedualAnAppointmentScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule An Appointment'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stepper(
                type: StepperType.horizontal,
                currentStep: _currentStep,
                onStepTapped: (step) => setState(() => _currentStep = step),
                onStepContinue: _currentStep < 2
                    ? () => setState(() => _currentStep += 1)
                    : null,
                onStepCancel: _currentStep > 0
                    ? () => setState(() => _currentStep -= 1)
                    : null,
                steps: [
                  Step(
                    title: const Text('Select Date'),
                    content: const Text('Select Date'),
                    isActive: _currentStep >= 0,
                    state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Select Time'),
                    content: const Text('Select Time'),
                    isActive: _currentStep >= 1,
                    state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Confirm'),
                    content: const Text('Confirm'),
                    isActive: _currentStep >= 2,
                    state: _currentStep == 2 ? StepState.complete : StepState.indexed,
                  ),
                ],
              ),
            ),
            Expanded(
              child: StepContent(
                step: _currentStep,
                businessName: widget.businessName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepContent extends StatelessWidget {
  final int step;
  final String businessName;

  const StepContent({
    required this.step,
    required this.businessName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    switch (step) {
      case 0:
        return Center(child: Text('Step 1: Select a Date for $businessName'));
      case 1:
        return Center(child: Text('Step 2: Select a Time for $businessName'));
      case 2:
        return Center(child: Text('Step 3: Confirm your Appointment with $businessName'));
      default:
        return const Center(child: Text('Unknown step'));
    }
  }
}
