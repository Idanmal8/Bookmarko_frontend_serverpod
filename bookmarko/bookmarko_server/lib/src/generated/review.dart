/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Review extends _i1.TableRow {
  Review({
    int? id,
    required this.businessId,
    required this.userId,
    required this.stars,
    this.review,
    required this.datePublished,
  }) : super(id);

  factory Review.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Review(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      businessId: serializationManager
          .deserialize<int>(jsonSerialization['businessId']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      stars: serializationManager.deserialize<int>(jsonSerialization['stars']),
      review: serializationManager
          .deserialize<String?>(jsonSerialization['review']),
      datePublished: serializationManager
          .deserialize<DateTime>(jsonSerialization['datePublished']),
    );
  }

  static final t = ReviewTable();

  int businessId;

  int userId;

  int stars;

  String? review;

  DateTime datePublished;

  @override
  String get tableName => 'reviews';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'stars': stars,
      'review': review,
      'datePublished': datePublished,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'stars': stars,
      'review': review,
      'datePublished': datePublished,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'businessId': businessId,
      'userId': userId,
      'stars': stars,
      'review': review,
      'datePublished': datePublished,
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
      case 'stars':
        stars = value;
        return;
      case 'review':
        review = value;
        return;
      case 'datePublished':
        datePublished = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Review>> find(
    _i1.Session session, {
    ReviewExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Review>(
      where: where != null ? where(Review.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Review?> findSingleRow(
    _i1.Session session, {
    ReviewExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Review>(
      where: where != null ? where(Review.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Review?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Review>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ReviewExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Review>(
      where: where(Review.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Review row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Review row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Review row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ReviewExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Review>(
      where: where != null ? where(Review.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ReviewExpressionBuilder = _i1.Expression Function(ReviewTable);

class ReviewTable extends _i1.Table {
  ReviewTable() : super(tableName: 'reviews');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final businessId = _i1.ColumnInt('businessId');

  final userId = _i1.ColumnInt('userId');

  final stars = _i1.ColumnInt('stars');

  final review = _i1.ColumnString('review');

  final datePublished = _i1.ColumnDateTime('datePublished');

  @override
  List<_i1.Column> get columns => [
        id,
        businessId,
        userId,
        stars,
        review,
        datePublished,
      ];
}

@Deprecated('Use ReviewTable.t instead.')
ReviewTable tReview = ReviewTable();
