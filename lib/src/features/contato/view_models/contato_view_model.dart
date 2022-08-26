import 'package:laboratorio_ferreira_mobile/src/core/models/roles_enum.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

class ContatoViewModel {
  final Contato contato;
  ContatoViewModel(this.contato);

  int get hierarquia {
    return contato.categorias
        .map((categoria) => categoria.index)
        .reduce((value, element) => value < element ? value : element);
  }

  bool temHierarquiaDe(RolesEnum role) => hierarquia <= role.index;
}
