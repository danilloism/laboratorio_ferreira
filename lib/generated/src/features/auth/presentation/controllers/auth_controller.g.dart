// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/auth/presentation/controllers/auth_controller.dart';

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

String $AuthControllerHash() => r'ef69dc4afc498d676974532f5b76602e697467fe';

/// See also [AuthController].
final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $AuthControllerHash,
);
typedef AuthControllerRef = NotifierProviderRef<AuthState>;

abstract class _$AuthController extends Notifier<AuthState> {
  @override
  AuthState build();
}

String $usuarioLogadoHash() => r'e513fcd849a9d5cd39b85d25a769c0fe7d67b494';

/// See also [usuarioLogado].
final usuarioLogadoProvider = AutoDisposeProvider<Contato?>(
  usuarioLogado,
  name: r'usuarioLogadoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $usuarioLogadoHash,
);
typedef UsuarioLogadoRef = AutoDisposeProviderRef<Contato?>;
