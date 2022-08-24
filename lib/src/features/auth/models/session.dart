// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

part '../../../../generated/src/features/auth/models/session.freezed.dart';
part '../../../../generated/src/features/auth/models/session.g.dart';

@Freezed(makeCollectionsUnmodifiable: true, toJson: false, fromJson: false)
class Session with _$Session {
  @HiveType(typeId: 2)
  const factory Session({
    @HiveField(0) required Contato contato,
    @HiveField(1) required DateTime expiresIn,
    @HiveField(2) required DateTime logInDate,
  }) = _AuthModel;
}
