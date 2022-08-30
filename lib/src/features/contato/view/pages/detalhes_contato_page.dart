import 'package:flutter/material.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/data/models/contato.dart';

class DetalhesContatoPage extends StatelessWidget {
  final Contato _contato;

  const DetalhesContatoPage(this._contato, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_contato.nome),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Telefones', style: Theme.of(context).textTheme.headline5),
              Wrap(
                  children: _contato.telefones
                      .map((telefone) => Chip(label: Text(telefone)))
                      .toList()),
              const SizedBox(height: 16),
              Text('Categorias', style: Theme.of(context).textTheme.headline5),
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
