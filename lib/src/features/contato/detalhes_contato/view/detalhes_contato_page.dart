import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/extensions/build_context_extension.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/common/data/models/contato.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/bloc/editor_contato_cubit.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/editor_contato/view/editor_contato_page.dart';

class DetalhesContatoPage extends StatelessWidget {
  final Contato _contato;

  const DetalhesContatoPage(this._contato, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_contato.nome),
        actions: [
          IconButton(
              onPressed: () => BlocProvider(
                    create: (ctx) => EditorContatoCubit(_contato),
                    child: const EditorContatoPage(),
                  ),
              icon: const Icon(Icons.edit)),
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Telefones', style: context.theme.textTheme.headline5),
              Wrap(
                  children: _contato.telefones
                      .map((telefone) => Chip(label: Text(telefone)))
                      .toList()),
              const SizedBox(height: 16),
              Text('Categorias', style: context.theme.textTheme.headline5),
              Wrap(
                  children: _contato.categorias
                      .map((categoria) =>
                          Chip(label: Text(categoria.capitalized)))
                      .toList(growable: false)),
            ],
          ),
        ),
      ),
    );
  }
}
