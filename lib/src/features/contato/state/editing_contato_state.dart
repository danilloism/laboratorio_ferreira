import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/src/features/contato/state/editing_contato_state.freezed.dart';

@freezed
class EditingContatoState with _$EditingContatoState {
  const factory EditingContatoState.done() = _Done;
  const factory EditingContatoState.editing() = _Editing;

  const EditingContatoState._();
}
