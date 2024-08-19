import 'package:bookmarko_flutter/screens/calendar_screen/widget/schedual_an_appointment_bottom_sheet.dart';
import 'package:bookmarko_flutter/screens/home_screen/widgets/schedual_configuration_bottom_sheet.dart';
import 'package:bookmarko_flutter/screens/home_screen/widgets/statistic_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<StatisticCard> statisticCards = [
      const StatisticCard(
        color: Colors.red,
        title: 'appointments',
        value: '80%',
        indicatorValue: 0.8,
      ),
      const StatisticCard(
        color: Colors.green,
        title: 'No-show',
        value: '20%',
        indicatorValue: 0.2,
      ),
      const StatisticCard(
        color: Colors.purple,
        title: 'Paid',
        value: '7/10',
        indicatorValue: 0.7,
      ),
      const StatisticCard(
        color: Colors.blue,
        title: 'Revenue',
        value: '95%',
        indicatorValue: 0.95,
      ),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const SchedualConfigurationBottomSheet();
            
                
              
            },
          );
        },
        child: const Icon(Icons.rocket_launch_rounded),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 100, // or any fixed height you want
              child: Center(
                  child: Text(
                'Welcome Idan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: statisticCards.length,
                itemBuilder: (context, index) {
                  return statisticCards[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
