import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/models.dart';

part '../../../../../generated/src/features/auth/domain/models/session.freezed.dart';
part '../../../../../generated/src/features/auth/domain/models/session.g.dart';

@Freezed(toJson: true)
class Session with _$Session {
  const factory Session({
    required String accessToken,
    required Contato contato,
  }) = _AuthModel;

  factory Session.fromJson(Object? json) =>
      _$SessionFromJson(json as Map<String, dynamic>);
}
