// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewUserUsername {
  final String userName;
  NewUserUsername({
    required this.userName,
  });

  NewUserUsername copyWith({
    String? userName,
  }) {
    return NewUserUsername(
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
    };
  }

  factory NewUserUsername.fromMap(Map<String, dynamic> map) {
    return NewUserUsername(
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserUsername.fromJson(String source) =>
      NewUserUsername.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewUserUsername(userName: $userName)';

  @override
  bool operator ==(covariant NewUserUsername other) {
    if (identical(this, other)) return true;

    return other.userName == userName;
  }

  @override
  int get hashCode => userName.hashCode;
}
