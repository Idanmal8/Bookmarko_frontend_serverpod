/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Business extends _i1.SerializableEntity {
  Business({
    this.id,
    required this.fullName,
    required this.businessName,
    required this.phone,
    required this.address,
    required this.email,
    required this.proffesion,
    required this.joined,
    this.bio,
  });

  factory Business.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Business(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      fullName: serializationManager
          .deserialize<String>(jsonSerialization['fullName']),
      businessName: serializationManager
          .deserialize<String>(jsonSerialization['businessName']),
      phone:
          serializationManager.deserialize<String>(jsonSerialization['phone']),
      address: serializationManager
          .deserialize<String>(jsonSerialization['address']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      proffesion: serializationManager
          .deserialize<String>(jsonSerialization['proffesion']),
      joined: serializationManager
          .deserialize<DateTime>(jsonSerialization['joined']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String fullName;

  String businessName;

  String phone;

  String address;

  String email;

  String proffesion;

  DateTime joined;

  String? bio;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'businessName': businessName,
      'phone': phone,
      'address': address,
      'email': email,
      'proffesion': proffesion,
      'joined': joined,
      'bio': bio,
    };
  }
}
