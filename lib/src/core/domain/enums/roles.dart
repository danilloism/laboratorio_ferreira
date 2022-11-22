import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
enum Roles {
  admin,
  gerente,
  colaborador,
  dentista,
  paciente,
  entregador,
  fornecedor;

  String get capitalized => '${name[0].toUpperCase()}${name.substring(1)}';

  bool get isAdmin => this == admin;

  bool get isGerente => this == gerente;

  bool get isColaborador => this == colaborador;

  bool get isDentista => this == dentista;

  bool get isPaciente => this == paciente;

  bool get isEntregador => this == entregador;

  bool get isFornecedor => this == fornecedor;

  T when<T extends Object?>({
    required T Function() gerente,
    required T Function() admin,
    required T Function() colaborador,
    required T Function() entregador,
    required T Function() fornecedor,
    required T Function() dentista,
    required T Function() paciente,
  }) {
    switch (this) {
      case Roles.admin:
        return admin.call();
      case Roles.gerente:
        return gerente.call();
      case Roles.colaborador:
        return colaborador.call();
      case Roles.dentista:
        return dentista.call();
      case Roles.paciente:
        return paciente.call();
      case Roles.entregador:
        return entregador.call();
      case Roles.fornecedor:
        return fornecedor.call();
    }
  }

  T maybeWhen<T extends Object?>({
    T Function()? gerente,
    T Function()? admin,
    T Function()? colaborador,
    T Function()? entregador,
    T Function()? fornecedor,
    T Function()? dentista,
    T Function()? paciente,
    required T Function() orElse,
  }) {
    switch (this) {
      case Roles.admin:
        return admin != null ? admin.call() : orElse.call();
      case Roles.gerente:
        return gerente != null ? gerente.call() : orElse.call();
      case Roles.colaborador:
        return colaborador != null ? colaborador.call() : orElse.call();
      case Roles.dentista:
        return dentista != null ? dentista.call() : orElse.call();
      case Roles.paciente:
        return paciente != null ? paciente.call() : orElse.call();
      case Roles.entregador:
        return entregador != null ? entregador.call() : orElse.call();
      case Roles.fornecedor:
        return fornecedor != null ? fornecedor.call() : orElse.call();
    }
  }

  T? whenOrNull<T extends Object?>({
    T? Function()? gerente,
    T? Function()? admin,
    T? Function()? colaborador,
    T? Function()? entregador,
    T? Function()? fornecedor,
    T? Function()? dentista,
    T? Function()? paciente,
  }) {
    switch (this) {
      case Roles.admin:
        return admin?.call();
      case Roles.gerente:
        return gerente?.call();
      case Roles.colaborador:
        return colaborador?.call();
      case Roles.dentista:
        return dentista?.call();
      case Roles.paciente:
        return paciente?.call();
      case Roles.entregador:
        return entregador?.call();
      case Roles.fornecedor:
        return fornecedor?.call();
    }
  }
}
