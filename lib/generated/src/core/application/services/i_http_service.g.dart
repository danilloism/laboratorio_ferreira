// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/core/application/services/i_http_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$httpServiceHash() => r'd5c2db66059e4f58e8e574adc8679ed4191bd1c3';

/// See also [httpService].
final httpServiceProvider = AutoDisposeProvider<IHttpService>(
  httpService,
  name: r'httpServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$httpServiceHash,
);

typedef HttpServiceRef = AutoDisposeProviderRef<IHttpService>;

String _$dioHash() => r'f03ebf1c159e8b4b00d240583ae92c37019b5e73';

/// See also [dio].
final dioProvider = AutoDisposeProvider<Dio>(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
