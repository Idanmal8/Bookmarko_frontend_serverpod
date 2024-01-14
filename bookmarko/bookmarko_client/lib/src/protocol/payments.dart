/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Payment extends _i1.SerializableEntity {
  Payment({
    this.id,
    required this.businessId,
    required this.customerId,
    required this.dateAndTime,
    required this.serviceId,
    required this.amount,
  });

  factory Payment.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Payment(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      customerId: serializationManager
          .deserialize<int>(jsonSerialization['customerId']),
      dateAndTime: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateAndTime']),
      serviceId:
          serializationManager.deserialize<int>(jsonSerialization['serviceId']),
      amount:
          serializationManager.deserialize<double>(jsonSerialization['amount']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int businessId;

  int customerId;

  DateTime dateAndTime;

  int serviceId;

  double amount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'customerId': customerId,
      'dateAndTime': dateAndTime,
      'serviceId': serviceId,
      'amount': amount,
    };
  }
}
