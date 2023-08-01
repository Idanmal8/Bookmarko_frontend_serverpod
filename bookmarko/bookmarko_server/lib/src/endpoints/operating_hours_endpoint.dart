import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class OperatingHoursEndpoint extends Endpoint {
  Future<bool> addHours(Session session, OperatingHours hours) async {
    try {
      final checkHours = await OperatingHours.findSingleRow(session,
          where: (checkHours) =>
              checkHours.day.equals(hours.day) &
              ((checkHours.openTime > (hours.openTime)) &
              (checkHours.openTime < (hours.closeTime)) &
              (checkHours.closeTime < (hours.closeTime))) |

              ((checkHours.openTime < (hours.openTime)) &
              (checkHours.closeTime > (hours.closeTime))) | 
              
              ((checkHours.openTime < (hours.openTime)) &
              (checkHours.closeTime < (hours.closeTime))));

      if (checkHours != null) {
        return false;
      }

      await session.db.insert(hours);
      return true;
    } catch (e) {
      session.log('Error adding hours: $e');
      return false;
    }
  }
}
