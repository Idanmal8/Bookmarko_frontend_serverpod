/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Appointment extends _i1.TableRow {
  Appointment({
    int? id,
    required this.businessId,
    required this.userId,
    required this.serviceName,
    required this.serviceId,
    required this.status,
    required this.appointmentDate,
    required this.paid,
  }) : super(id);

  factory Appointment.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Appointment(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
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

  static final t = AppointmentTable();

  int businessId;

  int userId;

  String serviceName;

  int serviceId;

  String status;

  DateTime appointmentDate;

  bool paid;

  @override
  String get tableName => 'appointments';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'serviceName': serviceName,
      'serviceId': serviceId,
      'status': status,
      'appointmentDate': appointmentDate,
      'paid': paid,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'serviceName': serviceName,
      'serviceId': serviceId,
      'status': status,
      'appointmentDate': appointmentDate,
      'paid': paid,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'serviceName': serviceName,
      'serviceId': serviceId,
      'status': status,
      'appointmentDate': appointmentDate,
      'paid': paid,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'businessId':
        businessId = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'serviceName':
        serviceName = value;
        return;
      case 'serviceId':
        serviceId = value;
        return;
      case 'status':
        status = value;
        return;
      case 'appointmentDate':
        appointmentDate = value;
        return;
      case 'paid':
        paid = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Appointment>> find(
    _i1.Session session, {
    AppointmentExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Appointment>(
      where: where != null ? where(Appointment.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Appointment?> findSingleRow(
    _i1.Session session, {
    AppointmentExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Appointment>(
      where: where != null ? where(Appointment.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Appointment?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Appointment>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AppointmentExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Appointment>(
      where: where(Appointment.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AppointmentExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Appointment>(
      where: where != null ? where(Appointment.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AppointmentExpressionBuilder = _i1.Expression Function(
    AppointmentTable);

class AppointmentTable extends _i1.Table {
  AppointmentTable() : super(tableName: 'appointments');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final userId = _i1.ColumnInt('userId');

  final serviceName = _i1.ColumnString('serviceName');

  final serviceId = _i1.ColumnInt('serviceId');

  final status = _i1.ColumnString('status');

  final appointmentDate = _i1.ColumnDateTime('appointmentDate');

  final paid = _i1.ColumnBool('paid');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        userId,
        serviceName,
        serviceId,
        status,
        appointmentDate,
        paid,
      ];
}

@Deprecated('Use AppointmentTable.t instead.')
AppointmentTable tAppointment = AppointmentTable();
