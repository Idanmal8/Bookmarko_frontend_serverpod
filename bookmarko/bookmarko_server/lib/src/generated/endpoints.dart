/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/business_owners_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/users_endpoint.dart' as _i4;
import 'package:bookmarko_server/src/generated/business_owners.dart' as _i5;
import 'package:bookmarko_server/src/generated/users.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'businessOwners': _i2.BusinessOwnersEndpoint()
        ..initialize(
          server,
          'businessOwners',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'users': _i4.UsersEndpoint()
        ..initialize(
          server,
          'users',
          null,
        ),
    };
    connectors['businessOwners'] = _i1.EndpointConnector(
      name: 'businessOwners',
      endpoint: endpoints['businessOwners']!,
      methodConnectors: {
        'addBusiness': _i1.MethodConnector(
          name: 'addBusiness',
          params: {
            'business': _i1.ParameterDescription(
              name: 'business',
              type: _i1.getType<_i5.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i2.BusinessOwnersEndpoint)
                  .addBusiness(
            session,
            params['business'],
          ),
        ),
        'removeBusiness': _i1.MethodConnector(
          name: 'removeBusiness',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i2.BusinessOwnersEndpoint)
                  .removeBusiness(
            session,
            params['id'],
          ),
        ),
        'editBusiness': _i1.MethodConnector(
          name: 'editBusiness',
          params: {
            'business': _i1.ParameterDescription(
              name: 'business',
              type: _i1.getType<_i5.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i2.BusinessOwnersEndpoint)
                  .editBusiness(
            session,
            params['business'],
          ),
        ),
        'getBusiness': _i1.MethodConnector(
          name: 'getBusiness',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i2.BusinessOwnersEndpoint)
                  .getBusiness(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['users'] = _i1.EndpointConnector(
      name: 'users',
      endpoint: endpoints['users']!,
      methodConnectors: {
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i6.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i4.UsersEndpoint).addUser(
            session,
            params['user'],
          ),
        )
      },
    );
  }
}
