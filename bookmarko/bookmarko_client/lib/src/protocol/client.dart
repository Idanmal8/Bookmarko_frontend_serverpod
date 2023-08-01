/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:bookmarko_client/src/protocol/business_owners.dart' as _i3;
import 'package:bookmarko_client/src/protocol/users.dart' as _i4;
import 'dart:io' as _i5;
import 'protocol.dart' as _i6;

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

class _EndpointUsers extends _i1.EndpointRef {
  _EndpointUsers(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'users';

  _i2.Future<bool> addUser(_i4.User user) => caller.callServerEndpoint<bool>(
        'users',
        'addUser',
        {'user': user},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i5.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i6.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    businessOwners = _EndpointBusinessOwners(this);
    example = _EndpointExample(this);
    users = _EndpointUsers(this);
  }

  late final _EndpointBusinessOwners businessOwners;

  late final _EndpointExample example;

  late final _EndpointUsers users;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'businessOwners': businessOwners,
        'example': example,
        'users': users,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
