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

String _$AuthControllerHash() => r'43044a07c0b2717ced9431542dffa6c46535f04f';

/// See also [AuthController].
final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$AuthControllerHash,
);

typedef AuthControllerRef = NotifierProviderRef<AuthState>;

abstract class _$AuthController extends Notifier<AuthState> {
  @override
  AuthState build();
}

String _$usuarioLogadoHash() => r'15bfe968bd960c2aa7f204157b8265afbcf18f22';

/// See also [usuarioLogado].
final usuarioLogadoProvider = AutoDisposeProvider<Contato?>(
  usuarioLogado,
  name: r'usuarioLogadoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usuarioLogadoHash,
);

typedef UsuarioLogadoRef = AutoDisposeProviderRef<Contato?>;

String _$tokenHash() => r'b8e811cddbc6f44fcb43d7a5d3dca6e1cbd4bb6a';

/// See also [token].
final tokenProvider = AutoDisposeProvider<String?>(
  token,
  name: r'tokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$tokenHash,
);

typedef TokenRef = AutoDisposeProviderRef<String?>;

String _$sessionHash() => r'746a2c3263c5e8e08dfd972f332c4c2874786929';

/// See also [session].
final sessionProvider = AutoDisposeProvider<Session?>(
  session,
  name: r'sessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sessionHash,
);

typedef SessionRef = AutoDisposeProviderRef<Session?>;
