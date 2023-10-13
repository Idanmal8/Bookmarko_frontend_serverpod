/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class ImageAsset extends _i1.TableRow {
  ImageAsset({
    int? id,
    required this.image_kind,
    required this.image_s3_id,
    required this.uploaded_timestamp,
    required this.user_id,
  }) : super(id);

  factory ImageAsset.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ImageAsset(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      image_kind: serializationManager
          .deserialize<String>(jsonSerialization['image_kind']),
      image_s3_id: serializationManager
          .deserialize<String>(jsonSerialization['image_s3_id']),
      uploaded_timestamp: serializationManager
          .deserialize<DateTime>(jsonSerialization['uploaded_timestamp']),
      user_id:
          serializationManager.deserialize<int>(jsonSerialization['user_id']),
    );
  }

  static final t = ImageAssetTable();

  String image_kind;

  String image_s3_id;

  DateTime uploaded_timestamp;

  int user_id;

  @override
  String get tableName => 'user_assets';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_kind': image_kind,
      'image_s3_id': image_s3_id,
      'uploaded_timestamp': uploaded_timestamp,
      'user_id': user_id,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'image_kind': image_kind,
      'image_s3_id': image_s3_id,
      'uploaded_timestamp': uploaded_timestamp,
      'user_id': user_id,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'image_kind': image_kind,
      'image_s3_id': image_s3_id,
      'uploaded_timestamp': uploaded_timestamp,
      'user_id': user_id,
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
      case 'image_kind':
        image_kind = value;
        return;
      case 'image_s3_id':
        image_s3_id = value;
        return;
      case 'uploaded_timestamp':
        uploaded_timestamp = value;
        return;
      case 'user_id':
        user_id = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<ImageAsset>> find(
    _i1.Session session, {
    ImageAssetExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ImageAsset>(
      where: where != null ? where(ImageAsset.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImageAsset?> findSingleRow(
    _i1.Session session, {
    ImageAssetExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ImageAsset>(
      where: where != null ? where(ImageAsset.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<ImageAsset?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ImageAsset>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required ImageAssetExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ImageAsset>(
      where: where(ImageAsset.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    ImageAsset row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    ImageAsset row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    ImageAsset row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    ImageAssetExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ImageAsset>(
      where: where != null ? where(ImageAsset.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef ImageAssetExpressionBuilder = _i1.Expression Function(ImageAssetTable);

class ImageAssetTable extends _i1.Table {
  ImageAssetTable() : super(tableName: 'user_assets');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final image_kind = _i1.ColumnString('image_kind');

  final image_s3_id = _i1.ColumnString('image_s3_id');

  final uploaded_timestamp = _i1.ColumnDateTime('uploaded_timestamp');

  final user_id = _i1.ColumnInt('user_id');

  @override
  List<_i1.Column> get columns => [
        id,
        image_kind,
        image_s3_id,
        uploaded_timestamp,
        user_id,
      ];
}

@Deprecated('Use ImageAssetTable.t instead.')
ImageAssetTable tImageAsset = ImageAssetTable();
