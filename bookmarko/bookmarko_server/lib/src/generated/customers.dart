/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Customer extends _i1.TableRow {
  Customer({
    int? id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.email,
    required this.joined,
    required this.businessId,
  }) : super(id);

  factory Customer.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Customer(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      firstName: serializationManager
          .deserialize<String>(jsonSerialization['firstName']),
      lastName: serializationManager
          .deserialize<String>(jsonSerialization['lastName']),
      phone:
          serializationManager.deserialize<String>(jsonSerialization['phone']),
      email:
          serializationManager.deserialize<String?>(jsonSerialization['email']),
      joined: serializationManager
          .deserialize<DateTime>(jsonSerialization['joined']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
    );
  }

  static final t = CustomerTable();

  String firstName;

  String lastName;

  String phone;

  String? email;

  DateTime joined;

  int businessId;

  @override
  String get tableName => 'customers';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'joined': joined,
      'businessId': businessId,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'joined': joined,
      'businessId': businessId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'joined': joined,
      'businessId': businessId,
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
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'phone':
        phone = value;
        return;
      case 'email':
        email = value;
        return;
      case 'joined':
        joined = value;
        return;
      case 'businessId':
        businessId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Customer>> find(
    _i1.Session session, {
    CustomerExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Customer>(
      where: where != null ? where(Customer.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Customer?> findSingleRow(
    _i1.Session session, {
    CustomerExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Customer>(
      where: where != null ? where(Customer.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Customer?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Customer>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CustomerExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Customer>(
      where: where(Customer.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Customer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CustomerExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Customer>(
      where: where != null ? where(Customer.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CustomerExpressionBuilder = _i1.Expression Function(CustomerTable);

class CustomerTable extends _i1.Table {
  CustomerTable() : super(tableName: 'customers');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final firstName = _i1.ColumnString('firstName');

  final lastName = _i1.ColumnString('lastName');

  final phone = _i1.ColumnString('phone');

  final email = _i1.ColumnString('email');

  final joined = _i1.ColumnDateTime('joined');

  final businessId = _i1.ColumnInt('businessId');

  @override
  List<_i1.Column> get columns => [
        id,
        firstName,
        lastName,
        phone,
        email,
        joined,
        businessId,
      ];
}

@Deprecated('Use CustomerTable.t instead.')
CustomerTable tCustomer = CustomerTable();
