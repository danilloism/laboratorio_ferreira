import 'package:collection/collection.dart';

const nomeVazio = 'Campo "Nome" deve ser preenchido.';
const telefonesVazio = 'O contato deve ter no mínimo 1 telefone.';
const categoriasVazio = 'O contato deve ter no mínimo 1 categoria.';
const nomeMaiorQue80 = 'O campo "Contato" deve ter no máximo 80 caracteres.';

class EditorContatoErrorManager {
  final _errors = <String>{};
  List<String> get errors => UnmodifiableListView(_errors);

  EditorContatoErrorManager();
  EditorContatoErrorManager.nomeVazioTelefonesVazio() {
    _errors.addAll([nomeVazio, telefonesVazio]);
  }

  void addCategoriaVazio() => _errors.add(categoriasVazio);
  void _addNomeVazio() => _errors.add(nomeVazio);
  void _addNomeMaiorQue80() => _errors.add(nomeMaiorQue80);
  void _addTelefonesVazio() => _errors.add(telefonesVazio);
  void _removeNomeVazio() => _errors.remove(nomeVazio);
  void _removeNomeMaiorQue80() => _errors.remove(nomeMaiorQue80);
  void _removeTelefonesVazio() => _errors.remove(telefonesVazio);
  void _removeCategoriasVazio() => _errors.remove(categoriasVazio);

  void handleAlteracaoNome(String nome) {
    if (nome.trim().isEmpty) {
      _addNomeVazio();
    } else {
      _removeNomeVazio();
    }

    if (nome.trim().length > 80) {
      _addNomeMaiorQue80();
    } else {
      _removeNomeMaiorQue80();
    }
  }

  void handleRemoverTelefone(int iterableSize) {
    if (iterableSize == 0) {
      _addTelefonesVazio();
    }
  }

  void handleRemoverCategoria(int iterableSize) {
    if (iterableSize == 0) {
      addCategoriaVazio();
    }
  }

  void handleAdicionarCategoria() => _removeCategoriasVazio();

  void handleAdicionarTelefone() => _removeTelefonesVazio();
}
