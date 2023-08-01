/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'appointments.dart' as _i2;
import 'business_owners.dart' as _i3;
import 'example.dart' as _i4;
import 'operating_hours.dart' as _i5;
import 'payments.dart' as _i6;
import 'review.dart' as _i7;
import 'services.dart' as _i8;
import 'subscriptions.dart' as _i9;
import 'users.dart' as _i10;
export 'appointments.dart';
export 'business_owners.dart';
export 'example.dart';
export 'operating_hours.dart';
export 'payments.dart';
export 'review.dart';
export 'services.dart';
export 'subscriptions.dart';
export 'users.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Appointment) {
      return _i2.Appointment.fromJson(data, this) as T;
    }
    if (t == _i3.Business) {
      return _i3.Business.fromJson(data, this) as T;
    }
    if (t == _i4.Example) {
      return _i4.Example.fromJson(data, this) as T;
    }
    if (t == _i5.OperatingHours) {
      return _i5.OperatingHours.fromJson(data, this) as T;
    }
    if (t == _i6.Payment) {
      return _i6.Payment.fromJson(data, this) as T;
    }
    if (t == _i7.Review) {
      return _i7.Review.fromJson(data, this) as T;
    }
    if (t == _i8.Service) {
      return _i8.Service.fromJson(data, this) as T;
    }
    if (t == _i9.Subscription) {
      return _i9.Subscription.fromJson(data, this) as T;
    }
    if (t == _i10.User) {
      return _i10.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Appointment?>()) {
      return (data != null ? _i2.Appointment.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Business?>()) {
      return (data != null ? _i3.Business.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Example?>()) {
      return (data != null ? _i4.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.OperatingHours?>()) {
      return (data != null ? _i5.OperatingHours.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Payment?>()) {
      return (data != null ? _i6.Payment.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Review?>()) {
      return (data != null ? _i7.Review.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Service?>()) {
      return (data != null ? _i8.Service.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Subscription?>()) {
      return (data != null ? _i9.Subscription.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.User?>()) {
      return (data != null ? _i10.User.fromJson(data, this) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Appointment) {
      return 'Appointment';
    }
    if (data is _i3.Business) {
      return 'Business';
    }
    if (data is _i4.Example) {
      return 'Example';
    }
    if (data is _i5.OperatingHours) {
      return 'OperatingHours';
    }
    if (data is _i6.Payment) {
      return 'Payment';
    }
    if (data is _i7.Review) {
      return 'Review';
    }
    if (data is _i8.Service) {
      return 'Service';
    }
    if (data is _i9.Subscription) {
      return 'Subscription';
    }
    if (data is _i10.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Appointment') {
      return deserialize<_i2.Appointment>(data['data']);
    }
    if (data['className'] == 'Business') {
      return deserialize<_i3.Business>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i4.Example>(data['data']);
    }
    if (data['className'] == 'OperatingHours') {
      return deserialize<_i5.OperatingHours>(data['data']);
    }
    if (data['className'] == 'Payment') {
      return deserialize<_i6.Payment>(data['data']);
    }
    if (data['className'] == 'Review') {
      return deserialize<_i7.Review>(data['data']);
    }
    if (data['className'] == 'Service') {
      return deserialize<_i8.Service>(data['data']);
    }
    if (data['className'] == 'Subscription') {
      return deserialize<_i9.Subscription>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i10.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
