import 'package:bookmarko_flutter/screens/appointment_confirmation_screen/widget/information_card.dart';
import 'package:flutter/material.dart';

class AppointmentConfirmationScreen extends StatefulWidget {
  const AppointmentConfirmationScreen({super.key});

  @override
  State<AppointmentConfirmationScreen> createState() =>
      _AppointmentConfirmationScreenState();
}

class _AppointmentConfirmationScreenState
    extends State<AppointmentConfirmationScreen> with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<double>> _fadeAnimations;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();

    final int numberOfCards = 4;
    final int animationDuration = 500; // milliseconds
    final int staggerDelay = 100; // milliseconds

    _animationControllers = List.generate(
      numberOfCards,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: animationDuration),
      ),
    );

    _fadeAnimations = _animationControllers
        .map((controller) =>
            Tween<double>(begin: 0.0, end: 1.0).animate(controller))
        .toList();

    _slideAnimations = _animationControllers
        .map((controller) =>
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(controller))
        .toList();

    // Start the animations with a staggered delay
    for (var i = 0; i < numberOfCards; i++) {
      Future.delayed(Duration(milliseconds: (i+2) * staggerDelay), () {
        _animationControllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildAnimatedCard(int index) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(
        position: _slideAnimations[index],
        child: const InformationCard(
          title: "Map",
          subtitle: "GPS",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/backgrounds/abstract_bookmarko_background.png',
              ),
              // This ensures the image covers the entire background
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                    width: 110,
                  ),
                  const Text('Confirmation',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "VarelaRound",
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  // Expanded widget to fill the remaining space
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10, // Adjust spacing as needed
                      mainAxisSpacing: 10, // Adjust spacing as needed
                      children: List.generate(
                          4, (index) => _buildAnimatedCard(index)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 77, 198, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('I will be there!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "VarelaRound",
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 102, 102),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text('Cancel',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontFamily: "VarelaRound",
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
