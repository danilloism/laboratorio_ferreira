import 'package:laboratorio_ferreira_mobile/src/features/auth/models/account.dart';
import 'package:laboratorio_ferreira_mobile/src/features/auth/models/token.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato_model.dart';

class ApiResponse<T> {
  final bool sucesso;
  final T? dados;
  final String? mensagem;
  final dynamic erros;

  const ApiResponse({
    required this.sucesso,
    this.dados,
    this.mensagem,
    this.erros,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    if (T is List) {
      throw FormatException(
        'Tipo genérico informado não deve ser uma lista, para receber a propriedade <dados> como lista, deve ser usada a classe <ApiResponseWithDataAsList>',
        [ApiResponse, json],
      );
    }
    print(json['sucesso'] as bool);
    if ((json['sucesso'] as bool)) {
      print('aqui');
      return ApiResponse(
        sucesso: json['sucesso'],
        mensagem: json['mensagem'],
        erros: json['erro'],
      );
    }

    final dados = json['dados'];

    if (dados is Map<String, dynamic>) {
      if (T == ContatoModel) {
        return ApiResponse(
          sucesso: json['sucesso'],
          mensagem: json['mensagem'],
          dados: ContatoModel.fromJson(dados) as T,
          erros: json['erro'],
        );
      }

      if (T == Account) {
        return ApiResponse(
          sucesso: json['sucesso'],
          mensagem: json['mensagem'],
          dados: Account.fromJson(dados) as T,
          erros: json['erro'],
        );
      }

      if (T == Token) {
        return ApiResponse(
          sucesso: json['sucesso'],
          mensagem: json['mensagem'],
          dados: Token.fromJson(dados) as T,
          erros: json['erro'],
        );
      }
    }

    return ApiResponse(
      sucesso: json['sucesso'],
      mensagem: json['mensagem'],
      dados: dados,
      erros: json['erro'],
    );
  }
}

class ApiResponseWithDataAsList<T> extends ApiResponse<List<T>> {
  ApiResponseWithDataAsList({
    required super.sucesso,
    super.dados,
    super.erros,
    super.mensagem,
  });

  factory ApiResponseWithDataAsList.fromJson(
    Map<String, dynamic> json,
  ) {
    if (T == List) {
      throw FormatException(
        'Tipo genérico informado não deve ser uma lista, para receber a propriedade <dados> como lista, informe apenas o Model em que a lista é populada.',
        [ApiResponse, json],
      );
    }

    final dados = json['dados'];

    if (dados is List) {
      if (T == ContatoModel) {
        final dadosConvertidos =
            dados.map((contato) => ContatoModel.fromJson(contato) as T);

        return ApiResponseWithDataAsList(
          sucesso: json['sucesso'],
          mensagem: json['mensagem'],
          dados: dadosConvertidos.toList(),
          erros: json['erro'],
        );
      }

      if (T == Account) {
        final dadosConvertidos =
            dados.map((account) => Account.fromJson(account) as T);

        return ApiResponseWithDataAsList(
          sucesso: json['sucesso'],
          mensagem: json['mensagem'],
          dados: dadosConvertidos.toList(),
          erros: json['erro'],
        );
      }
    }

    return ApiResponseWithDataAsList(
      sucesso: json['sucesso'],
      mensagem: json['mensagem'],
      dados: dados,
      erros: json['erro'],
    );
  }
}
