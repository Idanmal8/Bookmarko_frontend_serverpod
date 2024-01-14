/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:bookmarko_client/src/protocol/appointments.dart' as _i3;
import 'package:bookmarko_client/src/protocol/assets.dart' as _i4;
import 'package:bookmarko_client/src/protocol/business_owners.dart' as _i5;
import 'package:bookmarko_client/src/protocol/operating_hours.dart' as _i6;
import 'package:bookmarko_client/src/protocol/services.dart' as _i7;
import 'package:bookmarko_client/src/protocol/customers.dart' as _i8;
import 'package:bookmarko_client/src/protocol/payments.dart' as _i9;
import 'dart:io' as _i10;
import 'protocol.dart' as _i11;

class _EndpointAppointments extends _i1.EndpointRef {
  _EndpointAppointments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appointments';

  _i2.Future<bool> addAppointment(_i3.Appointment appointment) =>
      caller.callServerEndpoint<bool>(
        'appointments',
        'addAppointment',
        {'appointment': appointment},
      );

  _i2.Future<bool> removeAppointment(int id) => caller.callServerEndpoint<bool>(
        'appointments',
        'removeAppointment',
        {'id': id},
      );

  _i2.Future<bool> editAppointment(_i3.Appointment appointment) =>
      caller.callServerEndpoint<bool>(
        'appointments',
        'editAppointment',
        {'appointment': appointment},
      );

  _i2.Future<List<_i3.Appointment>> getAppointments(
    int businessId,
    DateTime date,
  ) =>
      caller.callServerEndpoint<List<_i3.Appointment>>(
        'appointments',
        'getAppointments',
        {
          'businessId': businessId,
          'date': date,
        },
      );
}

class _EndpointAuth extends _i1.EndpointRef {
  _EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  _i2.Future<bool?> isAdmin() => caller.callServerEndpoint<bool?>(
        'auth',
        'isAdmin',
        {},
      );

  _i2.Future<void> logout() => caller.callServerEndpoint<void>(
        'auth',
        'logout',
        {},
      );

  _i2.Future<String?> login(String phone) => caller.callServerEndpoint<String?>(
        'auth',
        'login',
        {'phone': phone},
      );
}

class _EndpointBusinessAssets extends _i1.EndpointRef {
  _EndpointBusinessAssets(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'businessAssets';

  _i2.Future<bool> addAsset(_i4.ImageAsset asset) =>
      caller.callServerEndpoint<bool>(
        'businessAssets',
        'addAsset',
        {'asset': asset},
      );

  _i2.Future<bool> removeAsset(int id) => caller.callServerEndpoint<bool>(
        'businessAssets',
        'removeAsset',
        {'id': id},
      );

  _i2.Future<bool> editAsset(_i4.ImageAsset asset) =>
      caller.callServerEndpoint<bool>(
        'businessAssets',
        'editAsset',
        {'asset': asset},
      );

  _i2.Future<List<_i4.ImageAsset>?> getAssets(int businessId) =>
      caller.callServerEndpoint<List<_i4.ImageAsset>?>(
        'businessAssets',
        'getAssets',
        {'businessId': businessId},
      );
}

class _EndpointBusinessOwners extends _i1.EndpointRef {
  _EndpointBusinessOwners(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'businessOwners';

  _i2.Future<bool> addBusiness(_i5.Business business) =>
      caller.callServerEndpoint<bool>(
        'businessOwners',
        'addBusiness',
        {'business': business},
      );

  _i2.Future<bool> removeBusiness(int id) => caller.callServerEndpoint<bool>(
        'businessOwners',
        'removeBusiness',
        {'id': id},
      );

  _i2.Future<bool> editBusiness(_i5.Business business) =>
      caller.callServerEndpoint<bool>(
        'businessOwners',
        'editBusiness',
        {'business': business},
      );

  _i2.Future<_i5.Business?> getBusiness(int id) =>
      caller.callServerEndpoint<_i5.Business?>(
        'businessOwners',
        'getBusiness',
        {'id': id},
      );
}

class _EndpointBusinessOwnersInformation extends _i1.EndpointRef {
  _EndpointBusinessOwnersInformation(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'businessOwnersInformation';

  _i2.Future<_i5.Business?> getBusinessInformation() =>
      caller.callServerEndpoint<_i5.Business?>(
        'businessOwnersInformation',
        'getBusinessInformation',
        {},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointOperatingHours extends _i1.EndpointRef {
  _EndpointOperatingHours(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'operatingHours';

  _i2.Future<bool> addHours(_i6.OperatingHours hours) =>
      caller.callServerEndpoint<bool>(
        'operatingHours',
        'addHours',
        {'hours': hours},
      );

  _i2.Future<bool> removeHours(int id) => caller.callServerEndpoint<bool>(
        'operatingHours',
        'removeHours',
        {'id': id},
      );

  _i2.Future<bool> editHours(List<_i6.OperatingHours> operatingHoursList) =>
      caller.callServerEndpoint<bool>(
        'operatingHours',
        'editHours',
        {'operatingHoursList': operatingHoursList},
      );

  _i2.Future<List<_i6.OperatingHours>> getHours(int businessId) =>
      caller.callServerEndpoint<List<_i6.OperatingHours>>(
        'operatingHours',
        'getHours',
        {'businessId': businessId},
      );
}

class _EndpointServices extends _i1.EndpointRef {
  _EndpointServices(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'services';

  _i2.Future<bool> addService(_i7.Service service) =>
      caller.callServerEndpoint<bool>(
        'services',
        'addService',
        {'service': service},
      );

  _i2.Future<bool> removeService(int id) => caller.callServerEndpoint<bool>(
        'services',
        'removeService',
        {'id': id},
      );

  _i2.Future<bool> editService(_i7.Service service) =>
      caller.callServerEndpoint<bool>(
        'services',
        'editService',
        {'service': service},
      );

  _i2.Future<List<_i7.Service>> getServices(int businessId) =>
      caller.callServerEndpoint<List<_i7.Service>>(
        'services',
        'getServices',
        {'businessId': businessId},
      );
}

class _EndpointUserCustomer extends _i1.EndpointRef {
  _EndpointUserCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'userCustomer';

  _i2.Future<bool> addUser(_i8.Customer user) =>
      caller.callServerEndpoint<bool>(
        'userCustomer',
        'addUser',
        {'user': user},
      );

  _i2.Future<bool> removeUser(int id) => caller.callServerEndpoint<bool>(
        'userCustomer',
        'removeUser',
        {'id': id},
      );

  _i2.Future<bool> editUser(_i8.Customer user) =>
      caller.callServerEndpoint<bool>(
        'userCustomer',
        'editUser',
        {'user': user},
      );

  _i2.Future<_i8.Customer?> getCustomerInformation(int id) =>
      caller.callServerEndpoint<_i8.Customer?>(
        'userCustomer',
        'getCustomerInformation',
        {'id': id},
      );

  _i2.Future<List<_i8.Customer>> getCustomers(int id) =>
      caller.callServerEndpoint<List<_i8.Customer>>(
        'userCustomer',
        'getCustomers',
        {'id': id},
      );

  _i2.Future<List<_i9.Payment?>> getCustomerPayments(int id) =>
      caller.callServerEndpoint<List<_i9.Payment?>>(
        'userCustomer',
        'getCustomerPayments',
        {'id': id},
      );

  _i2.Future<List<_i3.Appointment?>> getCustomerAppointments(int id) =>
      caller.callServerEndpoint<List<_i3.Appointment?>>(
        'userCustomer',
        'getCustomerAppointments',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i10.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i11.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    appointments = _EndpointAppointments(this);
    auth = _EndpointAuth(this);
    businessAssets = _EndpointBusinessAssets(this);
    businessOwners = _EndpointBusinessOwners(this);
    businessOwnersInformation = _EndpointBusinessOwnersInformation(this);
    example = _EndpointExample(this);
    operatingHours = _EndpointOperatingHours(this);
    services = _EndpointServices(this);
    userCustomer = _EndpointUserCustomer(this);
  }

  late final _EndpointAppointments appointments;

  late final _EndpointAuth auth;

  late final _EndpointBusinessAssets businessAssets;

  late final _EndpointBusinessOwners businessOwners;

  late final _EndpointBusinessOwnersInformation businessOwnersInformation;

  late final _EndpointExample example;

  late final _EndpointOperatingHours operatingHours;

  late final _EndpointServices services;

  late final _EndpointUserCustomer userCustomer;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'appointments': appointments,
        'auth': auth,
        'businessAssets': businessAssets,
        'businessOwners': businessOwners,
        'businessOwnersInformation': businessOwnersInformation,
        'example': example,
        'operatingHours': operatingHours,
        'services': services,
        'userCustomer': userCustomer,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
