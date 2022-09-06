import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/lista_contatos/view/lista_contatos_page_view.dart';
import 'package:laboratorio_ferreira_mobile/src/features/servico/presentation/view/pages/servicos_page_view.dart';

class NavigationIndexCubit extends Cubit<int> {
  NavigationIndexCubit() : super(0);

  void goTo(int index) {
    final limiteIndex = pages.length - 1;
    assert(index >= 0 && index <= limiteIndex);
    emit(index);
  }

  void goToInicio() => goTo(0);

  void goToContatos() => goTo(1);

  void goToServicos() => goTo(2);

  List<Widget> get pages => const [
        InicioPageView(),
        ContatosPageView(),
        ServicosPageView(),
      ];

  static NavigationIndexCubit of(BuildContext context) =>
      context.read<NavigationIndexCubit>();
}
