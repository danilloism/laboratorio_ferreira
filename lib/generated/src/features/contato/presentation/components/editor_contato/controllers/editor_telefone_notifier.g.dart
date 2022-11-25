// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../../../../src/features/contato/presentation/components/editor_contato/controllers/editor_telefone_notifier.dart';

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

String $EditorTelefoneControllerHash() =>
    r'bc6bc354a8356d64b383d7829bce04f63cdd6a77';

/// See also [EditorTelefoneController].
class EditorTelefoneControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditorTelefoneController, TelefoneInput> {
  EditorTelefoneControllerProvider([
    this.initialValue,
  ]) : super(
          () => EditorTelefoneController()..initialValue = initialValue,
          from: editorTelefoneControllerProvider,
          name: r'editorTelefoneControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $EditorTelefoneControllerHash,
        );

  final String? initialValue;

  @override
  bool operator ==(Object other) {
    return other is EditorTelefoneControllerProvider &&
        other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  TelefoneInput runNotifierBuild(
    covariant _$EditorTelefoneController notifier,
  ) {
    return notifier.build(
      initialValue,
    );
  }
}

typedef EditorTelefoneControllerRef
    = AutoDisposeNotifierProviderRef<TelefoneInput>;

/// See also [EditorTelefoneController].
final editorTelefoneControllerProvider = EditorTelefoneControllerFamily();

class EditorTelefoneControllerFamily extends Family<TelefoneInput> {
  EditorTelefoneControllerFamily();

  EditorTelefoneControllerProvider call([
    String? initialValue,
  ]) {
    return EditorTelefoneControllerProvider(
      initialValue,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<EditorTelefoneController, TelefoneInput>
      getProviderOverride(
    covariant EditorTelefoneControllerProvider provider,
  ) {
    return call(
      provider.initialValue,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'editorTelefoneControllerProvider';
}

abstract class _$EditorTelefoneController
    extends BuildlessAutoDisposeNotifier<TelefoneInput> {
  late final String? initialValue;

  TelefoneInput build([
    String? initialValue,
  ]);
}
