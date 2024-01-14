/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/appointments_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/business_assets_endpont.dart' as _i4;
import '../endpoints/business_owners_endpoint.dart' as _i5;
import '../endpoints/business_owners_information.dart' as _i6;
import '../endpoints/example_endpoint.dart' as _i7;
import '../endpoints/operating_hours_endpoint.dart' as _i8;
import '../endpoints/services_endpoint.dart' as _i9;
import '../endpoints/user_customers_endpoint.dart' as _i10;
import 'package:bookmarko_server/src/generated/appointments.dart' as _i11;
import 'package:bookmarko_server/src/generated/assets.dart' as _i12;
import 'package:bookmarko_server/src/generated/business_owners.dart' as _i13;
import 'package:bookmarko_server/src/generated/operating_hours.dart' as _i14;
import 'package:bookmarko_server/src/generated/services.dart' as _i15;
import 'package:bookmarko_server/src/generated/customers.dart' as _i16;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'appointments': _i2.AppointmentsEndpoint()
        ..initialize(
          server,
          'appointments',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'businessAssets': _i4.BusinessAssetsEndpoint()
        ..initialize(
          server,
          'businessAssets',
          null,
        ),
      'businessOwners': _i5.BusinessOwnersEndpoint()
        ..initialize(
          server,
          'businessOwners',
          null,
        ),
      'businessOwnersInformation': _i6.BusinessOwnersInformationEndpoint()
        ..initialize(
          server,
          'businessOwnersInformation',
          null,
        ),
      'example': _i7.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'operatingHours': _i8.OperatingHoursEndpoint()
        ..initialize(
          server,
          'operatingHours',
          null,
        ),
      'services': _i9.ServicesEndpoint()
        ..initialize(
          server,
          'services',
          null,
        ),
      'userCustomer': _i10.UserCustomerEndpoint()
        ..initialize(
          server,
          'userCustomer',
          null,
        ),
    };
    connectors['appointments'] = _i1.EndpointConnector(
      name: 'appointments',
      endpoint: endpoints['appointments']!,
      methodConnectors: {
        'addAppointment': _i1.MethodConnector(
          name: 'addAppointment',
          params: {
            'appointment': _i1.ParameterDescription(
              name: 'appointment',
              type: _i1.getType<_i11.Appointment>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appointments'] as _i2.AppointmentsEndpoint)
                  .addAppointment(
            session,
            params['appointment'],
          ),
        ),
        'removeAppointment': _i1.MethodConnector(
          name: 'removeAppointment',
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
              (endpoints['appointments'] as _i2.AppointmentsEndpoint)
                  .removeAppointment(
            session,
            params['id'],
          ),
        ),
        'editAppointment': _i1.MethodConnector(
          name: 'editAppointment',
          params: {
            'appointment': _i1.ParameterDescription(
              name: 'appointment',
              type: _i1.getType<_i11.Appointment>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appointments'] as _i2.AppointmentsEndpoint)
                  .editAppointment(
            session,
            params['appointment'],
          ),
        ),
        'getAppointments': _i1.MethodConnector(
          name: 'getAppointments',
          params: {
            'businessId': _i1.ParameterDescription(
              name: 'businessId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appointments'] as _i2.AppointmentsEndpoint)
                  .getAppointments(
            session,
            params['businessId'],
            params['date'],
          ),
        ),
      },
    );
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
              (endpoints['auth'] as _i3.AuthEndpoint).isAdmin(session),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['auth'] as _i3.AuthEndpoint).logout(session),
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
              (endpoints['auth'] as _i3.AuthEndpoint).login(
            session,
            params['phone'],
          ),
        ),
      },
    );
    connectors['businessAssets'] = _i1.EndpointConnector(
      name: 'businessAssets',
      endpoint: endpoints['businessAssets']!,
      methodConnectors: {
        'addAsset': _i1.MethodConnector(
          name: 'addAsset',
          params: {
            'asset': _i1.ParameterDescription(
              name: 'asset',
              type: _i1.getType<_i12.ImageAsset>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessAssets'] as _i4.BusinessAssetsEndpoint)
                  .addAsset(
            session,
            params['asset'],
          ),
        ),
        'removeAsset': _i1.MethodConnector(
          name: 'removeAsset',
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
              (endpoints['businessAssets'] as _i4.BusinessAssetsEndpoint)
                  .removeAsset(
            session,
            params['id'],
          ),
        ),
        'editAsset': _i1.MethodConnector(
          name: 'editAsset',
          params: {
            'asset': _i1.ParameterDescription(
              name: 'asset',
              type: _i1.getType<_i12.ImageAsset>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessAssets'] as _i4.BusinessAssetsEndpoint)
                  .editAsset(
            session,
            params['asset'],
          ),
        ),
        'getAssets': _i1.MethodConnector(
          name: 'getAssets',
          params: {
            'businessId': _i1.ParameterDescription(
              name: 'businessId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessAssets'] as _i4.BusinessAssetsEndpoint)
                  .getAssets(
            session,
            params['businessId'],
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
              type: _i1.getType<_i13.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i5.BusinessOwnersEndpoint)
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
              (endpoints['businessOwners'] as _i5.BusinessOwnersEndpoint)
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
              type: _i1.getType<_i13.Business>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwners'] as _i5.BusinessOwnersEndpoint)
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
              (endpoints['businessOwners'] as _i5.BusinessOwnersEndpoint)
                  .getBusiness(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['businessOwnersInformation'] = _i1.EndpointConnector(
      name: 'businessOwnersInformation',
      endpoint: endpoints['businessOwnersInformation']!,
      methodConnectors: {
        'getBusinessInformation': _i1.MethodConnector(
          name: 'getBusinessInformation',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['businessOwnersInformation']
                      as _i6.BusinessOwnersInformationEndpoint)
                  .getBusinessInformation(session),
        )
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
              (endpoints['example'] as _i7.ExampleEndpoint).hello(
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
              type: _i1.getType<_i14.OperatingHours>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatingHours'] as _i8.OperatingHoursEndpoint)
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
              (endpoints['operatingHours'] as _i8.OperatingHoursEndpoint)
                  .removeHours(
            session,
            params['id'],
          ),
        ),
        'editHours': _i1.MethodConnector(
          name: 'editHours',
          params: {
            'operatingHoursList': _i1.ParameterDescription(
              name: 'operatingHoursList',
              type: _i1.getType<List<_i14.OperatingHours>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatingHours'] as _i8.OperatingHoursEndpoint)
                  .editHours(
            session,
            params['operatingHoursList'],
          ),
        ),
        'getHours': _i1.MethodConnector(
          name: 'getHours',
          params: {
            'businessId': _i1.ParameterDescription(
              name: 'businessId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['operatingHours'] as _i8.OperatingHoursEndpoint)
                  .getHours(
            session,
            params['businessId'],
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
              type: _i1.getType<_i15.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i9.ServicesEndpoint).addService(
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
              (endpoints['services'] as _i9.ServicesEndpoint).removeService(
            session,
            params['id'],
          ),
        ),
        'editService': _i1.MethodConnector(
          name: 'editService',
          params: {
            'service': _i1.ParameterDescription(
              name: 'service',
              type: _i1.getType<_i15.Service>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i9.ServicesEndpoint).editService(
            session,
            params['service'],
          ),
        ),
        'getServices': _i1.MethodConnector(
          name: 'getServices',
          params: {
            'businessId': _i1.ParameterDescription(
              name: 'businessId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['services'] as _i9.ServicesEndpoint).getServices(
            session,
            params['businessId'],
          ),
        ),
      },
    );
    connectors['userCustomer'] = _i1.EndpointConnector(
      name: 'userCustomer',
      endpoint: endpoints['userCustomer']!,
      methodConnectors: {
        'addUser': _i1.MethodConnector(
          name: 'addUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.Customer>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint).addUser(
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
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint)
                  .removeUser(
            session,
            params['id'],
          ),
        ),
        'editUser': _i1.MethodConnector(
          name: 'editUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i16.Customer>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint).editUser(
            session,
            params['user'],
          ),
        ),
        'getCustomerInformation': _i1.MethodConnector(
          name: 'getCustomerInformation',
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
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint)
                  .getCustomerInformation(
            session,
            params['id'],
          ),
        ),
        'getCustomers': _i1.MethodConnector(
          name: 'getCustomers',
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
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint)
                  .getCustomers(
            session,
            params['id'],
          ),
        ),
        'getCustomerPayments': _i1.MethodConnector(
          name: 'getCustomerPayments',
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
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint)
                  .getCustomerPayments(
            session,
            params['id'],
          ),
        ),
        'getCustomerAppointments': _i1.MethodConnector(
          name: 'getCustomerAppointments',
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
              (endpoints['userCustomer'] as _i10.UserCustomerEndpoint)
                  .getCustomerAppointments(
            session,
            params['id'],
          ),
        ),
      },
    );
  }
}
