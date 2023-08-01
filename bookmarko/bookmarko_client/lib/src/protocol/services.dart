/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Service extends _i1.SerializableEntity {
  Service({
    this.id,
    required this.businessId,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
  });

  factory Service.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Service(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      serviceName: serializationManager
          .deserialize<String>(jsonSerialization['serviceName']),
      serviceDuration: serializationManager
          .deserialize<int>(jsonSerialization['serviceDuration']),
      servicePrice: serializationManager
          .deserialize<double>(jsonSerialization['servicePrice']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int businessId;

  String serviceName;

  int serviceDuration;

  double servicePrice;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'serviceName': serviceName,
      'serviceDuration': serviceDuration,
      'servicePrice': servicePrice,
    };
  }
}
