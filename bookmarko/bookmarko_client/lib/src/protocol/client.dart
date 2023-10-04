/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:bookmarko_client/src/protocol/business_owners.dart' as _i3;
import 'package:bookmarko_client/src/protocol/operating_hours.dart' as _i4;
import 'package:bookmarko_client/src/protocol/services.dart' as _i5;
import 'package:bookmarko_client/src/protocol/users.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

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

class _EndpointBusinessOwners extends _i1.EndpointRef {
  _EndpointBusinessOwners(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'businessOwners';

  _i2.Future<bool> addBusiness(_i3.Business business) =>
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

  _i2.Future<bool> editBusiness(_i3.Business business) =>
      caller.callServerEndpoint<bool>(
        'businessOwners',
        'editBusiness',
        {'business': business},
      );

  _i2.Future<_i3.Business?> getBusiness(int id) =>
      caller.callServerEndpoint<_i3.Business?>(
        'businessOwners',
        'getBusiness',
        {'id': id},
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

  _i2.Future<bool> addHours(_i4.OperatingHours hours) =>
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

  _i2.Future<bool> editHours(_i4.OperatingHours hours) =>
      caller.callServerEndpoint<bool>(
        'operatingHours',
        'editHours',
        {'hours': hours},
      );

  _i2.Future<List<_i4.OperatingHours?>> getHours(int id) =>
      caller.callServerEndpoint<List<_i4.OperatingHours?>>(
        'operatingHours',
        'getHours',
        {'id': id},
      );
}

class _EndpointServices extends _i1.EndpointRef {
  _EndpointServices(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'services';

  _i2.Future<bool> addService(_i5.Service service) =>
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

  _i2.Future<bool> editService(_i5.Service service) =>
      caller.callServerEndpoint<bool>(
        'services',
        'editService',
        {'service': service},
      );

  _i2.Future<List<_i5.Service?>> getService(int id) =>
      caller.callServerEndpoint<List<_i5.Service?>>(
        'services',
        'getService',
        {'id': id},
      );
}

class _EndpointUsers extends _i1.EndpointRef {
  _EndpointUsers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'users';

  _i2.Future<bool> addUser(_i6.User user) => caller.callServerEndpoint<bool>(
        'users',
        'addUser',
        {'user': user},
      );

  _i2.Future<bool> removeUser(int id) => caller.callServerEndpoint<bool>(
        'users',
        'removeUser',
        {'id': id},
      );

  _i2.Future<bool> editUser(_i6.User user) => caller.callServerEndpoint<bool>(
        'users',
        'editUser',
        {'user': user},
      );

  _i2.Future<_i6.User?> getUser(int id) => caller.callServerEndpoint<_i6.User?>(
        'users',
        'getUser',
        {'id': id},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    auth = _EndpointAuth(this);
    businessOwners = _EndpointBusinessOwners(this);
    example = _EndpointExample(this);
    operatingHours = _EndpointOperatingHours(this);
    services = _EndpointServices(this);
    users = _EndpointUsers(this);
  }

  late final _EndpointAuth auth;

  late final _EndpointBusinessOwners businessOwners;

  late final _EndpointExample example;

  late final _EndpointOperatingHours operatingHours;

  late final _EndpointServices services;

  late final _EndpointUsers users;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'auth': auth,
        'businessOwners': businessOwners,
        'example': example,
        'operatingHours': operatingHours,
        'services': services,
        'users': users,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
