import 'package:serverpod/serverpod.dart';

import 'package:bookmarko_server/src/generated/protocol.dart';

class ServicesEndpoint extends Endpoint {
  Future<bool> addService(Session session, Service service) async {
    try {
      final checkService = await Service.findSingleRow(session,
          where: (checkService) =>
              checkService.serviceName.equals(service.serviceName) &
              checkService.serviceDuration.equals(service.serviceDuration) &
              checkService.servicePrice.equals(service.servicePrice));

      if (checkService != null) {
        return false;
      }

      await session.db.insert(service);
      return true;

    } catch (e) {
      session.log('Error adding service: $e');
      return false;
    }
  }

  Future<bool> removeService(Session session, int id) async {
    final service = await session.db.findById<Service>(id);
    if(service == null){
      return false;
    }
    await session.db.deleteRow(service);
    return true;
  }

  Future<bool> editService(Session session, Service service) async {
    final oldService = await Service.findSingleRow(session,
        where: (oldService) =>
            oldService.id.equals(service.id ?? 0) &
            oldService.serviceName.equals(service.serviceName) &
            oldService.serviceDuration.equals(service.serviceDuration) &
            oldService.servicePrice.equals(service.servicePrice));

    if (oldService == null) {
      return false;
    }

    await session.db.update(service);
    return true;
  }

  Future<List<Service?>> getService(Session session, int id) async {
    return await session.db.find<Service>();
  }

}
