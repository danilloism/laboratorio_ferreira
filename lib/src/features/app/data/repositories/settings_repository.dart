import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/features/app/data/models/app_settings.dart';

class AppSettingsRepository extends HydratedCubit<AppSettings?> {
  AppSettingsRepository([super.state]);

  @override
  AppSettings? fromJson(Map<String, dynamic> json) =>
      AppSettings.fromJson(json['app_settings']);

  @override
  Map<String, dynamic>? toJson(AppSettings? state) =>
      {'app_settings': state?.toJson()};
}
