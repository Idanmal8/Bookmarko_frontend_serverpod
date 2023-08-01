import 'package:bookmarko_flutter/models/badge_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

class ProfileController extends ChangeNotifier {
  final String _userId;
  final List<BadgeModel> _badges = const [
    BadgeModel(
      name: 'Beginner',
      color: Color(0xFFE0E0E0),
    ),
    BadgeModel(
      name: 'Intermediate',
      color: Color(0xFFE0E0E0),
    ),
    BadgeModel(
      name: 'Advanced',
      color: Color(0xFFE0E0E0),
    ),
  ];
  ProfileController(String userId) : _userId = userId;

  List<BadgeModel> get badges => [..._badges];
}
