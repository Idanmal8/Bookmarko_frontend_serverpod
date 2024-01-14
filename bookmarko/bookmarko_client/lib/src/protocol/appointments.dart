/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Appointment extends _i1.SerializableEntity {
  Appointment({
    this.id,
    required this.businessId,
    required this.customerId,
    required this.customerName,
    required this.serviceName,
    required this.serviceId,
    required this.status,
    required this.appointmentDate,
    required this.paid,
  });

  factory Appointment.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Appointment(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      customerId: serializationManager
          .deserialize<int>(jsonSerialization['customerId']),
      customerName: serializationManager
          .deserialize<String>(jsonSerialization['customerName']),
      serviceName: serializationManager
          .deserialize<String>(jsonSerialization['serviceName']),
      serviceId:
          serializationManager.deserialize<int>(jsonSerialization['serviceId']),
      status:
          serializationManager.deserialize<String>(jsonSerialization['status']),
      appointmentDate: serializationManager
          .deserialize<DateTime>(jsonSerialization['appointmentDate']),
      paid: serializationManager.deserialize<bool>(jsonSerialization['paid']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int businessId;

  int customerId;

  String customerName;

  String serviceName;

  int serviceId;

  String status;

  DateTime appointmentDate;

  bool paid;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'customerId': customerId,
      'customerName': customerName,
      'serviceName': serviceName,
      'serviceId': serviceId,
      'status': status,
      'appointmentDate': appointmentDate,
      'paid': paid,
    };
  }
}
