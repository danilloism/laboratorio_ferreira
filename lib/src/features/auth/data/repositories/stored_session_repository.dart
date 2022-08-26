import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/data/models/session.dart';

class StoredSessionRepository extends HydratedCubit<Session?> {
  StoredSessionRepository(super.state);

  void reset([Session? session]) => emit(session);

  @override
  Session? fromJson(Map<String, dynamic> json) =>
      Session.fromJson(json['session']);

  @override
  Map<String, dynamic>? toJson(Session? state) => {'session': state?.toJson()};
}
