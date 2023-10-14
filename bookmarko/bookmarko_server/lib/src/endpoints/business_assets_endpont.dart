import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class BusinessAssetsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<bool> addAsset(Session session, ImageAsset asset) async {
    await session.db.insert(asset);
    return true;
  }

  Future<bool> removeAsset(Session session, int id) async {
    final asset = await session.db.findById<ImageAsset>(id);
    if (asset == null) {
      return false;
    }
    await session.db.deleteRow(asset);
    return true;
  }

  Future<bool> editAsset(Session session, ImageAsset asset) async {
    final oldAsset = await session.db.findById<ImageAsset>(asset.id ?? 0);
    if (oldAsset == null) {
      return false;
    }
    await session.db.update(asset);
    return true;
  }

  Future<ImageAsset?> getAsset(
      Session session, int id, String kindOfAsset) async {
    final businessId = await session.auth.authenticatedUserId;

    if (businessId == null) {
      return null;
    }

    final asset = await session.db.findById<ImageAsset>(id);

    if (asset == null) {
      return null;
    }

    if (asset.image_kind != kindOfAsset) {
      return null;
    }

    return ImageAsset(
      id: asset.id,
      image_kind: asset.image_kind,
      image_s3_id: asset.image_s3_id,
      uploaded_timestamp: asset.uploaded_timestamp,
      user_id: asset.user_id,
    );
  }
}
