// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/painting.dart';

class BadgeModel {
  final String name;
  final Color color;

  const BadgeModel({
    required this.name,
    required this.color,
  });

  BadgeModel copyWith({
    String? name,
    Color? color,
  }) {
    return BadgeModel(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'color': color.value,
    };
  }

  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel(
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BadgeModel.fromJson(String source) =>
      BadgeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BadgeModel(name: $name, color: $color)';

  @override
  bool operator ==(covariant BadgeModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}
