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

  Future<bool> removeHours(Session session, int id) async {
    final hours = await session.db.findById<OperatingHours>(id);
    if (hours == null) {
      return false;
    }
    await session.db.deleteRow(hours);
    return true;
  }

  Future<bool> editHours(Session session, OperatingHours hours) async {
    final oldHours = await OperatingHours.findSingleRow(session,
        where: (oldHours) =>
            oldHours.id.equals(hours.id ?? 0) & oldHours.day.equals(hours.day));

    if (oldHours == null) {
      return false;
    }

    await session.db.update(hours);
    return true;
  }

  Future<List<OperatingHours?>> getHours(Session session, int id) async {
    return await session.db.find<OperatingHours>();
  }

}
