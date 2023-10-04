/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../endpoints/business_owners_endpoint.dart' as _i3;
import '../endpoints/example_endpoint.dart' as _i4;
import '../endpoints/operating_hours_endpoint.dart' as _i5;
import '../endpoints/services_endpoint.dart' as _i6;
import '../endpoints/users_endpoint.dart' as _i7;
import 'package:bookmarko_server/src/generated/business_owners.dart' as _i8;
import 'package:bookmarko_server/src/generated/operating_hours.dart' as _i9;
import 'package:bookmarko_server/src/generated/services.dart' as _i10;
import 'package:bookmarko_server/src/generated/users.dart' as _i11;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'businessOwners': _i3.BusinessOwnersEndpoint()
        ..initialize(
          server,
          'businessOwners',
          null,
        ),
      'example': _i4.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'operatingHours': _i5.OperatingHoursEndpoint()
        ..initialize(
          server,
          'operatingHours',
          null,
        ),
      'services': _i6.ServicesEndpoint()
        ..initialize(
          server,
          'services',
          null,
        ),
      'users': _i7.UsersEndpoint()
        ..initialize(
          server,
          'users',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'isAdmin': _i1.MethodConnector(
          name: 'isAdmin',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).isAdmin(session),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).logout(session),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i2.AuthEndpoint).login(
            session,
            params['phone'],
          ),
        ),
      },
    );
    connectors['businessOwners'] = _i1.EndpointConnector(
      name: 'businessOwners',
      endpoint: endpoints['businessOwners']!,
      methodConnectors: {
        'addBusiness': _i1.MethodConnector(
          name: 'addBusiness',
          params: {
            'business': _i1.ParameterDescription(
              name: 'business',
              type: _i1.getType<_i8.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i3.BusinessOwnersEndpoint)
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
              (endpoints['businessOwners'] as _i3.BusinessOwnersEndpoint)
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
              type: _i1.getType<_i8.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i3.BusinessOwnersEndpoint)
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
              (endpoints['businessOwners'] as _i3.BusinessOwnersEndpoint)
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
              (endpoints['example'] as _i4.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['operatingHours'] = _i1.EndpointConnector(
      name: 'operatingHours',
      endpoint: endpoints['operatingHours']!,
      methodConnectors: {
        'addHours': _i1.MethodConnector(
          name: 'addHours',
          params: {
            'hours': _i1.ParameterDescription(
              name: 'hours',
              type: _i1.getType<_i9.OperatingHours>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatingHours'] as _i5.OperatingHoursEndpoint)
                  .addHours(
            session,
            params['hours'],
          ),
        ),
        'removeHours': _i1.MethodConnector(
          name: 'removeHours',
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
              (endpoints['operatingHours'] as _i5.OperatingHoursEndpoint)
                  .removeHours(
            session,
            params['id'],
          ),
        ),
        'editHours': _i1.MethodConnector(
          name: 'editHours',
          params: {
            'hours': _i1.ParameterDescription(
              name: 'hours',
              type: _i1.getType<_i9.OperatingHours>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatingHours'] as _i5.OperatingHoursEndpoint)
                  .editHours(
            session,
            params['hours'],
          ),
        ),
        'getHours': _i1.MethodConnector(
          name: 'getHours',
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
              (endpoints['operatingHours'] as _i5.OperatingHoursEndpoint)
                  .getHours(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['services'] = _i1.EndpointConnector(
      name: 'services',
      endpoint: endpoints['services']!,
      methodConnectors: {
        'addService': _i1.MethodConnector(
          name: 'addService',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i10.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i6.ServicesEndpoint).addService(
            session,
            params['service'],
          ),
        ),
        'removeService': _i1.MethodConnector(
          name: 'removeService',
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
              (endpoints['services'] as _i6.ServicesEndpoint).removeService(
            session,
            params['id'],
          ),
        ),
        'editService': _i1.MethodConnector(
          name: 'editService',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i10.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i6.ServicesEndpoint).editService(
            session,
            params['service'],
          ),
        ),
        'getService': _i1.MethodConnector(
          name: 'getService',
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
              (endpoints['services'] as _i6.ServicesEndpoint).getService(
            session,
            params['id'],
          ),
        ),
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
              type: _i1.getType<_i11.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i7.UsersEndpoint).addUser(
            session,
            params['user'],
          ),
        ),
        'removeUser': _i1.MethodConnector(
          name: 'removeUser',
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
              (endpoints['users'] as _i7.UsersEndpoint).removeUser(
            session,
            params['id'],
          ),
        ),
        'editUser': _i1.MethodConnector(
          name: 'editUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i11.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['users'] as _i7.UsersEndpoint).editUser(
            session,
            params['user'],
          ),
        ),
        'getUser': _i1.MethodConnector(
          name: 'getUser',
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
              (endpoints['users'] as _i7.UsersEndpoint).getUser(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
