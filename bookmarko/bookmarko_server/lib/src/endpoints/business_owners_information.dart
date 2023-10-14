import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class BusinessOwnersInformationEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Business?> getBusinessInformation(Session session) async {
    final businessId = await session.auth.authenticatedUserId;

    if (businessId == null) {
      return null;
    }

    final business = await session.db.findById<Business>(businessId);

    if (business == null) {
      return null;
    }

    return Business(
      id: business.id,
      firstName: business.firstName,
      lastName: business.lastName,
      businessName: business.businessName,
      phone: business.phone,
      address: business.address,
      email: business.email,
      proffesion: business.proffesion,
      joined: business.joined,
      bio: business.bio,
    );
  }
}
