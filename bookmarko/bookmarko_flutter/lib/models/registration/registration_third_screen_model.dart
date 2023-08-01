// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewUserPersonalInfromation {
  final String email;
  final String phone;
  final String city;
  NewUserPersonalInfromation({
    required this.email,
    required this.phone,
    required this.city,
  });

  NewUserPersonalInfromation copyWith({
    String? email,
    String? phone,
    String? city,
  }) {
    return NewUserPersonalInfromation(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'city': city,
    };
  }

  factory NewUserPersonalInfromation.fromMap(Map<String, dynamic> map) {
    return NewUserPersonalInfromation(
      email: map['email'] as String,
      phone: map['phone'] as String,
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserPersonalInfromation.fromJson(String source) =>
      NewUserPersonalInfromation.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'NewUserPersonalInfromation(email: $email, phone: $phone, city: $city)';

  @override
  bool operator ==(covariant NewUserPersonalInfromation other) {
    if (identical(this, other)) return true;

    return other.email == email && other.phone == phone && other.city == city;
  }

  @override
  int get hashCode => email.hashCode ^ phone.hashCode ^ city.hashCode;
}
