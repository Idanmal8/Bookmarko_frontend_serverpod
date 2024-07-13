import 'package:flutter/material.dart';

class StatisticCard extends StatefulWidget {
  final Color color;
  final String title;
  final String value;
  final double indicatorValue;

  const StatisticCard({
    required this.color,
    required this.title,
    required this.value,
    required this.indicatorValue,
    super.key,
  });

  @override
  _StatisticCardState createState() => _StatisticCardState();
}

class _StatisticCardState extends State<StatisticCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.indicatorValue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Transform.rotate(
                angle: 3.14,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      color: widget.color,
                      value: _animation.value,
                      strokeWidth: 8,
                      strokeCap: StrokeCap.round,
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
