import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/common/enums/roles_enum.dart';

part '../../../../generated/src/features/auth/models/session.freezed.dart';
part '../../../../generated/src/features/auth/models/session.g.dart';

@Freezed(makeCollectionsUnmodifiable: true)
class Session with _$Session {
  @HiveType(typeId: 2)
  const factory Session({
    @HiveField(0) required Account account,
    @HiveField(1) required List<RolesEnum> roles,
    @HiveField(2) required DateTime expiresIn,
  }) = _AuthModel;
}
