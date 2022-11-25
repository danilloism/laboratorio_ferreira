import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../../../../generated/src/features/contato/presentation/components/editor_contato/states/editor_contato_page_state.freezed.dart';

@freezed
class EditorContatoPageState with _$EditorContatoPageState {
  const factory EditorContatoPageState.done() = _Done;
  const factory EditorContatoPageState.editing() = _Editing;

  const EditorContatoPageState._();
}
