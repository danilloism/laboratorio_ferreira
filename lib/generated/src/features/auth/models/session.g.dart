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
      contato: fields[0] as Contato,
      expiresIn: fields[1] as DateTime,
      logInDate: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_AuthModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.contato)
      ..writeByte(1)
      ..write(obj.expiresIn)
      ..writeByte(2)
      ..write(obj.logInDate);
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
