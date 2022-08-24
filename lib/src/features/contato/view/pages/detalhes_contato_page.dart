import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/models/contato.dart';

class DetalhesContatoPage extends ConsumerStatefulWidget {
  final Contato? contato;

  const DetalhesContatoPage({super.key, this.contato});

  @override
  ConsumerState<DetalhesContatoPage> createState() =>
      _DetalhesContatoPageState();
}

class _DetalhesContatoPageState extends ConsumerState<DetalhesContatoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _telefonesControllers = <TextEditingController>[];
  final _telefonesFormFieldCounter = StateProvider((ref) => 1);

  @override
  void initState() {
    final contato = widget.contato;
    if (contato != null) {
      _nomeController.text = contato.nome;
      for (final telefone in contato.telefones) {
        final controller = TextEditingController()..text = telefone;
        _telefonesControllers.add(controller);
      }
      ref.read(_telefonesFormFieldCounter.notifier).state =
          contato.telefones.length;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    for (final controller in _telefonesControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Nome'),
            TextFormField(
              controller: _nomeController,
            ),
            const Text('Categorias'),
            Wrap(
              children: widget.contato!.categorias
                  .map((categoria) => Chip(label: Text(categoria.capitalized)))
                  .toList(),
            ),
            const Text('Telefones'),
            ..._telefonesControllers
                .map((controller) => TextFormField(
                      controller: controller,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
