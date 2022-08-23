// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/common/enums/roles_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RolesEnumAdapter extends TypeAdapter<RolesEnum> {
  @override
  final int typeId = 0;

  @override
  RolesEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RolesEnum.admin;
      case 1:
        return RolesEnum.gerente;
      case 2:
        return RolesEnum.colaborador;
      case 3:
        return RolesEnum.dentista;
      case 4:
        return RolesEnum.paciente;
      case 5:
        return RolesEnum.entregador;
      case 6:
        return RolesEnum.fornecedor;
      default:
        return RolesEnum.admin;
    }
  }

  @override
  void write(BinaryWriter writer, RolesEnum obj) {
    switch (obj) {
      case RolesEnum.admin:
        writer.writeByte(0);
        break;
      case RolesEnum.gerente:
        writer.writeByte(1);
        break;
      case RolesEnum.colaborador:
        writer.writeByte(2);
        break;
      case RolesEnum.dentista:
        writer.writeByte(3);
        break;
      case RolesEnum.paciente:
        writer.writeByte(4);
        break;
      case RolesEnum.entregador:
        writer.writeByte(5);
        break;
      case RolesEnum.fornecedor:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RolesEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
