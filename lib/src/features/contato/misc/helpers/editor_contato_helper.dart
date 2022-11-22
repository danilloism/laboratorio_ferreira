import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

class EditorContatoHelper {
  static bool usuarioLogadoPodeEditarContato({
    required Contato usuarioLogado,
    required Contato contatoSendoEditado,
  }) {
    if (usuarioLogado.uid == contatoSendoEditado.uid) return true;
    return usuarioLogado.temHierarquiaMaiorQue(contatoSendoEditado.maiorRole);
  }
}
