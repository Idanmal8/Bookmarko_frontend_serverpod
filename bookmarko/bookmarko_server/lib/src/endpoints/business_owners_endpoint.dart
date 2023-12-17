import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class BusinessOwnersEndpoint extends Endpoint {

  //Add a business after filling business information.
  //- bio can be null.
  Future<bool> addBusiness(Session session, Business business) async {
    final checkBusinessExsits = await Business.findSingleRow(
      session,
      where: (checkBusinessExsits) => 
              (checkBusinessExsits.phone.equals(business.phone) | 
              checkBusinessExsits.email.equals(business.email)) & 
              checkBusinessExsits.businessName.equals(business.businessName),
    );

    if (checkBusinessExsits != null) {
      return false;
    }

    await session.db.insert(business);
    return true;

  }

  //Remove a business by id.
  Future<bool> removeBusiness(Session session, int id) async {
    final business = await session.db.findById<Business>(id);
    if(business == null){
      return false;
    }
    await session.db.deleteRow(business);
    return true;
  }

  //Edit a business by id.
  Future<bool> editBusiness(Session session, Business business) async {
    final oldBusiness = await session.db.findById<Business>(business.id ?? 0);
    if (oldBusiness == null) {
      return false;
    }
    await session.db.update(business);
    return true;
  }

  //Get a business by id.
  Future<Business?> getBusiness(Session session, int id) async {
    return await session.db.findById<Business>(id);
  }

}
