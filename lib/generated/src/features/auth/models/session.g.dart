// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../../src/features/auth/models/session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthModelAdapter extends TypeAdapter<_$_AuthModel> {
  @override
  final int typeId = 2;

  @override
  _$_AuthModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_AuthModel(
      account: fields[0] as Account,
      roles: (fields[1] as List).cast<RolesEnum>(),
      expiresIn: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_AuthModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.account)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(1)
      ..write(obj.roles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
