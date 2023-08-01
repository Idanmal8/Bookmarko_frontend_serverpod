/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Subscription extends _i1.TableRow {
  Subscription({
    int? id,
    required this.businessId,
    required this.userId,
    required this.dateAndTime,
  }) : super(id);

  factory Subscription.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Subscription(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      dateAndTime: serializationManager
          .deserialize<DateTime>(jsonSerialization['dateAndTime']),
    );
  }

  static final t = SubscriptionTable();

  int businessId;

  int userId;

  DateTime dateAndTime;

  @override
  String get tableName => 'subscriptions';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'dateAndTime': dateAndTime,
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
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Subscription>> find(
    _i1.Session session, {
    SubscriptionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Subscription>(
      where: where != null ? where(Subscription.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Subscription?> findSingleRow(
    _i1.Session session, {
    SubscriptionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Subscription>(
      where: where != null ? where(Subscription.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Subscription?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Subscription>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required SubscriptionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Subscription>(
      where: where(Subscription.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Subscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Subscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Subscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    SubscriptionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Subscription>(
      where: where != null ? where(Subscription.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef SubscriptionExpressionBuilder = _i1.Expression Function(
    SubscriptionTable);

class SubscriptionTable extends _i1.Table {
  SubscriptionTable() : super(tableName: 'subscriptions');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final userId = _i1.ColumnInt('userId');

  final dateAndTime = _i1.ColumnDateTime('dateAndTime');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        userId,
        dateAndTime,
      ];
}

@Deprecated('Use SubscriptionTable.t instead.')
SubscriptionTable tSubscription = SubscriptionTable();
