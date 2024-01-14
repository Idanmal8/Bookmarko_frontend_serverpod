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

  Future<List<ImageAsset>?> getAssets(Session session, int businessId) async {
    // Fetch the assets based on the kindOfAsset and businessId
    final assets = await ImageAsset.find(session,
        where: (asset) => asset.businessId.equals(businessId));
    print('assets: $assets');
    // If no assets are found, return an empty list
    if (assets.isEmpty) {
      return [];
    }

    return assets;
  }
}
