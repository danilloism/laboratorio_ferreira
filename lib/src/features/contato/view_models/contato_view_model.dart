import 'package:laboratorio_ferreira_mobile/src/core/data/models/roles.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/models/contato.dart';

class ContatoViewModel {
  final Contato contato;
  ContatoViewModel(this.contato);

  int get hierarquia {
    return contato.categorias
        .map((categoria) => categoria.index)
        .reduce((value, element) => value < element ? value : element);
  }

  bool temHierarquiaDe(Roles role) => hierarquia <= role.index;
}
