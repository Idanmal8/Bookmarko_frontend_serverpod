// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewUserProffesion {
  final String proffesion;
  NewUserProffesion({
    required this.proffesion,
  });

  NewUserProffesion copyWith({
    String? proffesion,
  }) {
    return NewUserProffesion(
      proffesion: proffesion ?? this.proffesion,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'proffesion': proffesion,
    };
  }

  factory NewUserProffesion.fromMap(Map<String, dynamic> map) {
    return NewUserProffesion(
      proffesion: map['proffesion'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserProffesion.fromJson(String source) =>
      NewUserProffesion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewUserProffesion(proffesion: $proffesion)';

  @override
  bool operator ==(covariant NewUserProffesion other) {
    if (identical(this, other)) return true;

    return other.proffesion == proffesion;
  }

  @override
  int get hashCode => proffesion.hashCode;
}
