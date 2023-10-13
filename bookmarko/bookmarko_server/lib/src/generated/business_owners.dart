/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Business extends _i1.TableRow {
  Business({
    int? id,
    required this.firstName,
    required this.lastName,
    required this.businessName,
    required this.phone,
    required this.address,
    required this.email,
    required this.proffesion,
    required this.joined,
    this.bio,
  }) : super(id);

  factory Business.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Business(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      firstName: serializationManager
          .deserialize<String>(jsonSerialization['firstName']),
      lastName: serializationManager
          .deserialize<String>(jsonSerialization['lastName']),
      businessName: serializationManager
          .deserialize<String>(jsonSerialization['businessName']),
      phone:
          serializationManager.deserialize<String>(jsonSerialization['phone']),
      address: serializationManager
          .deserialize<String>(jsonSerialization['address']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
      proffesion: serializationManager
          .deserialize<String>(jsonSerialization['proffesion']),
      joined: serializationManager
          .deserialize<DateTime>(jsonSerialization['joined']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
    );
  }

  static final t = BusinessTable();

  String firstName;

  String lastName;

  String businessName;

  String phone;

  String address;

  String email;

  String proffesion;

  DateTime joined;

  String? bio;

  @override
  String get tableName => 'business_owners';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'businessName': businessName,
      'phone': phone,
      'address': address,
      'email': email,
      'proffesion': proffesion,
      'joined': joined,
      'bio': bio,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'businessName': businessName,
      'phone': phone,
      'address': address,
      'email': email,
      'proffesion': proffesion,
      'joined': joined,
      'bio': bio,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'businessName': businessName,
      'phone': phone,
      'address': address,
      'email': email,
      'proffesion': proffesion,
      'joined': joined,
      'bio': bio,
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
      case 'businessName':
        businessName = value;
        return;
      case 'phone':
        phone = value;
        return;
      case 'address':
        address = value;
        return;
      case 'email':
        email = value;
        return;
      case 'proffesion':
        proffesion = value;
        return;
      case 'joined':
        joined = value;
        return;
      case 'bio':
        bio = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Business>> find(
    _i1.Session session, {
    BusinessExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Business>(
      where: where != null ? where(Business.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Business?> findSingleRow(
    _i1.Session session, {
    BusinessExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Business>(
      where: where != null ? where(Business.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Business?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Business>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required BusinessExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Business>(
      where: where(Business.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Business row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    BusinessExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Business>(
      where: where != null ? where(Business.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef BusinessExpressionBuilder = _i1.Expression Function(BusinessTable);

class BusinessTable extends _i1.Table {
  BusinessTable() : super(tableName: 'business_owners');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final firstName = _i1.ColumnString('firstName');

  final lastName = _i1.ColumnString('lastName');

  final businessName = _i1.ColumnString('businessName');

  final phone = _i1.ColumnString('phone');

  final address = _i1.ColumnString('address');

  final email = _i1.ColumnString('email');

  final proffesion = _i1.ColumnString('proffesion');

  final joined = _i1.ColumnDateTime('joined');

  final bio = _i1.ColumnString('bio');

  @override
  List<_i1.Column> get columns => [
        id,
        firstName,
        lastName,
        businessName,
        phone,
        address,
        email,
        proffesion,
        joined,
        bio,
      ];
}

@Deprecated('Use BusinessTable.t instead.')
BusinessTable tBusiness = BusinessTable();
