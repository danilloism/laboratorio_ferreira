import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laboratorio_ferreira_mobile/src/core/core.dart';

class NavigationIndexCubit extends Cubit<int> {
  NavigationIndexCubit([super.initialState = 0]) {
    assert(state >= 0 && state <= _limiteIndex);
  }

  int get _limiteIndex => HomePageTabs.values.length - 1;

  void goTo(int index) {
    assert(index >= 0 && index <= _limiteIndex);
    emit(index);
  }

  void goToInicio() => goTo(HomePageTabs.inicio.index);

  void goToContatos() => goTo(HomePageTabs.contatos.index);

  void goToServicos() => goTo(HomePageTabs.servicos.index);

  List<Widget> get pages => HomePageTabs.values.map((e) => e.page).toList();

  static NavigationIndexCubit of(BuildContext context) =>
      context.read<NavigationIndexCubit>();
}
