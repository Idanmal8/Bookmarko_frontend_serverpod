/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'appointments.dart' as _i2;
import 'assets.dart' as _i3;
import 'business_owners.dart' as _i4;
import 'example.dart' as _i5;
import 'operating_hours.dart' as _i6;
import 'payments.dart' as _i7;
import 'review.dart' as _i8;
import 'services.dart' as _i9;
import 'subscriptions.dart' as _i10;
import 'users.dart' as _i11;
import 'package:bookmarko_client/src/protocol/appointments.dart' as _i12;
import 'package:bookmarko_client/src/protocol/assets.dart' as _i13;
import 'package:bookmarko_client/src/protocol/operating_hours.dart' as _i14;
import 'package:bookmarko_client/src/protocol/services.dart' as _i15;
export 'appointments.dart';
export 'assets.dart';
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
    if (t == _i3.ImageAsset) {
      return _i3.ImageAsset.fromJson(data, this) as T;
    }
    if (t == _i4.Business) {
      return _i4.Business.fromJson(data, this) as T;
    }
    if (t == _i5.Example) {
      return _i5.Example.fromJson(data, this) as T;
    }
    if (t == _i6.OperatingHours) {
      return _i6.OperatingHours.fromJson(data, this) as T;
    }
    if (t == _i7.Payment) {
      return _i7.Payment.fromJson(data, this) as T;
    }
    if (t == _i8.Review) {
      return _i8.Review.fromJson(data, this) as T;
    }
    if (t == _i9.Service) {
      return _i9.Service.fromJson(data, this) as T;
    }
    if (t == _i10.Subscription) {
      return _i10.Subscription.fromJson(data, this) as T;
    }
    if (t == _i11.User) {
      return _i11.User.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Appointment?>()) {
      return (data != null ? _i2.Appointment.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.ImageAsset?>()) {
      return (data != null ? _i3.ImageAsset.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Business?>()) {
      return (data != null ? _i4.Business.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Example?>()) {
      return (data != null ? _i5.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.OperatingHours?>()) {
      return (data != null ? _i6.OperatingHours.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.Payment?>()) {
      return (data != null ? _i7.Payment.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.Review?>()) {
      return (data != null ? _i8.Review.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.Service?>()) {
      return (data != null ? _i9.Service.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.Subscription?>()) {
      return (data != null ? _i10.Subscription.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i11.User?>()) {
      return (data != null ? _i11.User.fromJson(data, this) : null) as T;
    }
    if (t == List<_i12.Appointment>) {
      return (data as List)
          .map((e) => deserialize<_i12.Appointment>(e))
          .toList() as dynamic;
    }
    if (t == _i1.getType<List<_i13.ImageAsset>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.ImageAsset>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i14.OperatingHours>) {
      return (data as List)
          .map((e) => deserialize<_i14.OperatingHours>(e))
          .toList() as dynamic;
    }
    if (t == List<_i15.Service>) {
      return (data as List).map((e) => deserialize<_i15.Service>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Appointment) {
      return 'Appointment';
    }
    if (data is _i3.ImageAsset) {
      return 'ImageAsset';
    }
    if (data is _i4.Business) {
      return 'Business';
    }
    if (data is _i5.Example) {
      return 'Example';
    }
    if (data is _i6.OperatingHours) {
      return 'OperatingHours';
    }
    if (data is _i7.Payment) {
      return 'Payment';
    }
    if (data is _i8.Review) {
      return 'Review';
    }
    if (data is _i9.Service) {
      return 'Service';
    }
    if (data is _i10.Subscription) {
      return 'Subscription';
    }
    if (data is _i11.User) {
      return 'User';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Appointment') {
      return deserialize<_i2.Appointment>(data['data']);
    }
    if (data['className'] == 'ImageAsset') {
      return deserialize<_i3.ImageAsset>(data['data']);
    }
    if (data['className'] == 'Business') {
      return deserialize<_i4.Business>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i5.Example>(data['data']);
    }
    if (data['className'] == 'OperatingHours') {
      return deserialize<_i6.OperatingHours>(data['data']);
    }
    if (data['className'] == 'Payment') {
      return deserialize<_i7.Payment>(data['data']);
    }
    if (data['className'] == 'Review') {
      return deserialize<_i8.Review>(data['data']);
    }
    if (data['className'] == 'Service') {
      return deserialize<_i9.Service>(data['data']);
    }
    if (data['className'] == 'Subscription') {
      return deserialize<_i10.Subscription>(data['data']);
    }
    if (data['className'] == 'User') {
      return deserialize<_i11.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
