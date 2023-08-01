/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Service extends _i1.TableRow {
  Service({
    int? id,
    required this.businessId,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
  }) : super(id);

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

  static final t = ServiceTable();

  int businessId;

  String serviceName;

  int serviceDuration;

  double servicePrice;

  @override
  String get tableName => 'services';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'serviceName': serviceName,
      'serviceDuration': serviceDuration,
      'servicePrice': servicePrice,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'serviceName': serviceName,
      'serviceDuration': serviceDuration,
      'servicePrice': servicePrice,
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
      case 'serviceName':
        serviceName = value;
        return;
      case 'serviceDuration':
        serviceDuration = value;
        return;
      case 'servicePrice':
        servicePrice = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Service>> find(
    _i1.Session session, {
    ServiceExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Service>(
      where: where != null ? where(Service.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Service?> findSingleRow(
    _i1.Session session, {
    ServiceExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Service>(
      where: where != null ? where(Service.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Service?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Service>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ServiceExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Service>(
      where: where(Service.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Service row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ServiceExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Service>(
      where: where != null ? where(Service.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ServiceExpressionBuilder = _i1.Expression Function(ServiceTable);

class ServiceTable extends _i1.Table {
  ServiceTable() : super(tableName: 'services');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final serviceName = _i1.ColumnString('serviceName');

  final serviceDuration = _i1.ColumnInt('serviceDuration');

  final servicePrice = _i1.ColumnDouble('servicePrice');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        serviceName,
        serviceDuration,
        servicePrice,
      ];
}

@Deprecated('Use ServiceTable.t instead.')
ServiceTable tService = ServiceTable();
