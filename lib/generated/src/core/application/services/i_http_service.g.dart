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

String $httpServiceHash() => r'a7589ee4c58ab3bed314b06a4048371ae076d03b';

/// See also [httpService].
final httpServiceProvider = AutoDisposeProvider<IHttpService>(
  httpService,
  name: r'httpServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $httpServiceHash,
);
typedef HttpServiceRef = AutoDisposeProviderRef<IHttpService>;
String $dioHash() => r'9b5a2cac23a0143bc0d6c42a9bda35e7f04c8a98';

/// See also [dio].
final dioProvider = AutoDisposeProvider<Dio>(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $dioHash,
);
typedef DioRef = AutoDisposeProviderRef<Dio>;
String $cancelTokenHash() => r'55a6d3ec799c5766c7da3da624663ad35714244b';

/// See also [cancelToken].
final cancelTokenProvider = AutoDisposeProvider<CancelToken>(
  cancelToken,
  name: r'cancelTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $cancelTokenHash,
);
typedef CancelTokenRef = AutoDisposeProviderRef<CancelToken>;
