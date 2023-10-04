import 'package:flutter/material.dart';

import 'package:bookmarko_flutter/models/badge_model.dart';

class Badges extends StatelessWidget {
  final List<BadgeModel> badgesList;

  const Badges({super.key, required this.badgesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: 8.0, // Horizontal spacing between badges
          runSpacing: 8.0, // Vertical spacing between rows
          children: badgesList.map((badgeTitle) => Badge(badgeTitle)).toList(),
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final BadgeModel badge;

  const Badge(this.badge, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: badge.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        child: Text(
          badge.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
