/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class OperatingHours extends _i1.TableRow {
  OperatingHours({
    int? id,
    required this.businessId,
    required this.day,
    required this.openTime,
    required this.closeTime,
  }) : super(id);

  factory OperatingHours.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return OperatingHours(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      day: serializationManager.deserialize<String>(jsonSerialization['day']),
      openTime: serializationManager
          .deserialize<DateTime>(jsonSerialization['openTime']),
      closeTime: serializationManager
          .deserialize<DateTime>(jsonSerialization['closeTime']),
    );
  }

  static final t = OperatingHoursTable();

  int businessId;

  String day;

  DateTime openTime;

  DateTime closeTime;

  @override
  String get tableName => 'operating_hours';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'day': day,
      'openTime': openTime,
      'closeTime': closeTime,
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
      case 'day':
        day = value;
        return;
      case 'openTime':
        openTime = value;
        return;
      case 'closeTime':
        closeTime = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<OperatingHours>> find(
    _i1.Session session, {
    OperatingHoursExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<OperatingHours>(
      where: where != null ? where(OperatingHours.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OperatingHours?> findSingleRow(
    _i1.Session session, {
    OperatingHoursExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<OperatingHours>(
      where: where != null ? where(OperatingHours.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<OperatingHours?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<OperatingHours>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required OperatingHoursExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OperatingHours>(
      where: where(OperatingHours.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    OperatingHours row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    OperatingHours row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    OperatingHours row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    OperatingHoursExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OperatingHours>(
      where: where != null ? where(OperatingHours.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef OperatingHoursExpressionBuilder = _i1.Expression Function(
    OperatingHoursTable);

class OperatingHoursTable extends _i1.Table {
  OperatingHoursTable() : super(tableName: 'operating_hours');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final day = _i1.ColumnString('day');

  final openTime = _i1.ColumnDateTime('openTime');

  final closeTime = _i1.ColumnDateTime('closeTime');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        day,
        openTime,
        closeTime,
      ];
}

@Deprecated('Use OperatingHoursTable.t instead.')
OperatingHoursTable tOperatingHours = OperatingHoursTable();
