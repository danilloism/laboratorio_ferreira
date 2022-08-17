import 'package:laboratorio_ferreira_mobile/src/features/common/models/date_log_model.dart';

abstract class UidWithDateLogModel extends DateLogModel {
  final String? uid;

  UidWithDateLogModel({this.uid, super.criadoEm, super.atualizadoEm});
}
