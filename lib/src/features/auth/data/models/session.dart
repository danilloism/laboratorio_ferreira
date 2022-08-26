// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

part '../../../../../generated/src/features/auth/data/models/session.freezed.dart';
part '../../../../../generated/src/features/auth/data/models/session.g.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required Contato contato,
    required String accessToken,
  }) = _AuthModel;

  factory Session.fromJson(Object? json) =>
      _$SessionFromJson(json as Map<String, dynamic>);
}
