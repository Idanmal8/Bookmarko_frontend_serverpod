/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class ImageAsset extends _i1.SerializableEntity {
  ImageAsset({
    this.id,
    required this.image_kind,
    required this.image_s3_id,
    required this.uploaded_timestamp,
    required this.user_id,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String image_kind;

  String image_s3_id;

  DateTime uploaded_timestamp;

  int user_id;

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
}
