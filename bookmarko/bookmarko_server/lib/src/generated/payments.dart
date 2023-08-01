/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Payment extends _i1.TableRow {
  Payment({
    int? id,
    required this.businessId,
    required this.userId,
    required this.dateAndTime,
    required this.serviceId,
    required this.amount,
  }) : super(id);

  factory Payment.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Payment(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      dateAndTime: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateAndTime']),
      serviceId:
          serializationManager.deserialize<int>(jsonSerialization['serviceId']),
      amount:
          serializationManager.deserialize<double>(jsonSerialization['amount']),
    );
  }

  static final t = PaymentTable();

  int businessId;

  int userId;

  DateTime dateAndTime;

  int serviceId;

  double amount;

  @override
  String get tableName => 'payments';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
      'serviceId': serviceId,
      'amount': amount,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
      'serviceId': serviceId,
      'amount': amount,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
      'serviceId': serviceId,
      'amount': amount,
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
      case 'dateAndTime':
        dateAndTime = value;
        return;
      case 'serviceId':
        serviceId = value;
        return;
      case 'amount':
        amount = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Payment>> find(
    _i1.Session session, {
    PaymentExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Payment>(
      where: where != null ? where(Payment.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Payment?> findSingleRow(
    _i1.Session session, {
    PaymentExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Payment>(
      where: where != null ? where(Payment.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Payment?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Payment>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PaymentExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Payment>(
      where: where(Payment.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Payment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Payment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Payment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PaymentExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Payment>(
      where: where != null ? where(Payment.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PaymentExpressionBuilder = _i1.Expression Function(PaymentTable);

class PaymentTable extends _i1.Table {
  PaymentTable() : super(tableName: 'payments');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final userId = _i1.ColumnInt('userId');

  final dateAndTime = _i1.ColumnDateTime('dateAndTime');

  final serviceId = _i1.ColumnInt('serviceId');

  final amount = _i1.ColumnDouble('amount');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        userId,
        dateAndTime,
        serviceId,
        amount,
      ];
}

@Deprecated('Use PaymentTable.t instead.')
PaymentTable tPayment = PaymentTable();
