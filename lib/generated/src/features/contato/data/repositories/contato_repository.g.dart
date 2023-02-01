// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../src/features/contato/data/repositories/contato_repository.dart';

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

String _$contatoRepositoryHash() => r'6faf6896846c6a0ca3c48b88a65b9db53901fec0';

/// See also [contatoRepository].
final contatoRepositoryProvider = AutoDisposeProvider<ContatoRepository>(
  contatoRepository,
  name: r'contatoRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contatoRepositoryHash,
);

typedef ContatoRepositoryRef = AutoDisposeProviderRef<ContatoRepository>;

String _$getOneContatoHash() => r'986d45c2729747ee283b4ea7d05f41465f7994fe';

/// See also [getOneContato].
class GetOneContatoProvider extends AutoDisposeFutureProvider<Contato> {
  GetOneContatoProvider(
    this.id,
  ) : super(
          (ref) => getOneContato(
            ref,
            id,
          ),
          from: getOneContatoProvider,
          name: r'getOneContatoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getOneContatoHash,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is GetOneContatoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetOneContatoRef = AutoDisposeFutureProviderRef<Contato>;

/// See also [getOneContato].
final getOneContatoProvider = GetOneContatoFamily();

class GetOneContatoFamily extends Family<AsyncValue<Contato>> {
  GetOneContatoFamily();

  GetOneContatoProvider call(
    String id,
  ) {
    return GetOneContatoProvider(
      id,
    );
  }

  @override
  AutoDisposeFutureProvider<Contato> getProviderOverride(
    covariant GetOneContatoProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getOneContatoProvider';
}

String _$getManyContatosHash() => r'c023c2694fea7c760a3d01a32b5450fcf0ea9557';

/// See also [getManyContatos].
class GetManyContatosProvider extends AutoDisposeFutureProvider<List<Contato>> {
  GetManyContatosProvider({
    this.queryParams,
    this.pagination,
  }) : super(
          (ref) => getManyContatos(
            ref,
            queryParams: queryParams,
            pagination: pagination,
          ),
          from: getManyContatosProvider,
          name: r'getManyContatosProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getManyContatosHash,
        );

  final Map<String, dynamic>? queryParams;
  final Pagination? pagination;

  @override
  bool operator ==(Object other) {
    return other is GetManyContatosProvider &&
        other.queryParams == queryParams &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryParams.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef GetManyContatosRef = AutoDisposeFutureProviderRef<List<Contato>>;

/// See also [getManyContatos].
final getManyContatosProvider = GetManyContatosFamily();

class GetManyContatosFamily extends Family<AsyncValue<List<Contato>>> {
  GetManyContatosFamily();

  GetManyContatosProvider call({
    Map<String, dynamic>? queryParams,
    Pagination? pagination,
  }) {
    return GetManyContatosProvider(
      queryParams: queryParams,
      pagination: pagination,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Contato>> getProviderOverride(
    covariant GetManyContatosProvider provider,
  ) {
    return call(
      queryParams: provider.queryParams,
      pagination: provider.pagination,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'getManyContatosProvider';
}

String _$updateContatoHash() => r'bee0d4fe01561bfd3344773fbf6b0831125a9296';

/// See also [updateContato].
class UpdateContatoProvider extends AutoDisposeFutureProvider<Contato> {
  UpdateContatoProvider(
    this.contato,
  ) : super(
          (ref) => updateContato(
            ref,
            contato,
          ),
          from: updateContatoProvider,
          name: r'updateContatoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateContatoHash,
        );

  final Contato contato;

  @override
  bool operator ==(Object other) {
    return other is UpdateContatoProvider && other.contato == contato;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contato.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef UpdateContatoRef = AutoDisposeFutureProviderRef<Contato>;

/// See also [updateContato].
final updateContatoProvider = UpdateContatoFamily();

class UpdateContatoFamily extends Family<AsyncValue<Contato>> {
  UpdateContatoFamily();

  UpdateContatoProvider call(
    Contato contato,
  ) {
    return UpdateContatoProvider(
      contato,
    );
  }

  @override
  AutoDisposeFutureProvider<Contato> getProviderOverride(
    covariant UpdateContatoProvider provider,
  ) {
    return call(
      provider.contato,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'updateContatoProvider';
}

String _$createContatoHash() => r'1d701096a0c3f6288752651f655bee565966056c';

/// See also [createContato].
class CreateContatoProvider extends AutoDisposeFutureProvider<Contato> {
  CreateContatoProvider(
    this.contato,
  ) : super(
          (ref) => createContato(
            ref,
            contato,
          ),
          from: createContatoProvider,
          name: r'createContatoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createContatoHash,
        );

  final Contato contato;

  @override
  bool operator ==(Object other) {
    return other is CreateContatoProvider && other.contato == contato;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contato.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef CreateContatoRef = AutoDisposeFutureProviderRef<Contato>;

/// See also [createContato].
final createContatoProvider = CreateContatoFamily();

class CreateContatoFamily extends Family<AsyncValue<Contato>> {
  CreateContatoFamily();

  CreateContatoProvider call(
    Contato contato,
  ) {
    return CreateContatoProvider(
      contato,
    );
  }

  @override
  AutoDisposeFutureProvider<Contato> getProviderOverride(
    covariant CreateContatoProvider provider,
  ) {
    return call(
      provider.contato,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'createContatoProvider';
}
