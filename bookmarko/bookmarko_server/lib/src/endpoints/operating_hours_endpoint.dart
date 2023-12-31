import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class OperatingHoursEndpoint extends Endpoint {
  Future<bool> addHours(Session session, OperatingHours hours) async {
    try {
      final checkHours = await OperatingHours.findSingleRow(session,
          where: (checkHours) =>
              checkHours.dayInWeek.equals(hours.dayInWeek) &
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

  Future<bool> editHours(
      Session session, List<OperatingHours> operatingHoursList) async {
    print("This is the list : $operatingHoursList");
    for (var object in operatingHoursList) {
      final dayDetail = await OperatingHours.findSingleRow(
        session,
        where: (oldHour) =>
            oldHour.dayInWeek.equals(object.dayInWeek) &
            oldHour.businessId.equals(object.businessId),
      );

      if (dayDetail == null) {
        await session.db.insert(object);
      } else {
        dayDetail.openTime = object.openTime;
        dayDetail.closeTime = object.closeTime;
        session.db.update(dayDetail);
      }
    }

    if (operatingHoursList.isEmpty) {
      return false;
    }

    return true;
  }

  Future<List<OperatingHours>> getHours(Session session, int businessId) async {
    List<String> days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];

    // Fetch existing hours from the database.
    final fetchedHours = await OperatingHours.find(session,
        where: (hours) => hours.businessId.equals(businessId));

    if (fetchedHours.isEmpty) {
      return [];
    }
    // Convert fetched hours into a map for easy lookup.
    var fetchedHoursMap = {for (var hour in fetchedHours) hour.dayInWeek: hour};

    // Prepare the final list.
    List<OperatingHours> finalHours = [];

    for (var day in days) {
      if (fetchedHoursMap.containsKey(day)) {
        finalHours.add(fetchedHoursMap[day]!);
      } else {
        finalHours.add(OperatingHours(
          businessId: businessId,
          dayInWeek: day,
          openTime: null, // Placeholder
          closeTime: null, // Placeholder
        ));
      }
    }

    return finalHours;
  }
}
