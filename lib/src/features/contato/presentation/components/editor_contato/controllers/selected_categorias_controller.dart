import 'package:laboratorio_ferreira_mobile/src/core/domain/domain.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../../../generated/src/features/contato/presentation/components/editor_contato/controllers/selected_categorias_controller.g.dart';

@riverpod
class SelectedCategoriasController extends _$SelectedCategoriasController {
  @override
  Set<Roles> build() {
    return {};
  }

  void add(Roles role) {
    state = {...state, role};
  }

  void remove(Roles role) {
    state = {...state}..remove(role);
  }
}
