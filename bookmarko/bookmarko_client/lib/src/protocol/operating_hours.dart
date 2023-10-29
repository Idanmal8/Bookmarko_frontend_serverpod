/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class OperatingHours extends _i1.SerializableEntity {
  OperatingHours({
    this.id,
    required this.businessId,
    required this.dayInWeek,
    this.openTime,
    this.closeTime,
  });

  factory OperatingHours.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OperatingHours(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      dayInWeek: serializationManager
          .deserialize<String>(jsonSerialization['dayInWeek']),
      openTime: serializationManager
          .deserialize<DateTime?>(jsonSerialization['openTime']),
      closeTime: serializationManager
          .deserialize<DateTime?>(jsonSerialization['closeTime']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int businessId;

  String dayInWeek;

  DateTime? openTime;

  DateTime? closeTime;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'dayInWeek': dayInWeek,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }
}
