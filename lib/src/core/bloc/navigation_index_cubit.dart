import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationIndexCubit extends Cubit<int> {
  NavigationIndexCubit() : super(0);

  void goTo(int index) {
    assert(index >= 0 && index <= 2);
    emit(index);
  }

  void goToInicio() => goTo(0);
  void goToContatos() => goTo(1);
  void goToServicos() => goTo(2);

  static NavigationIndexCubit of(BuildContext context) =>
      context.read<NavigationIndexCubit>();
  static NavigationIndexCubit watcherOf(BuildContext context) =>
      context.watch<NavigationIndexCubit>();
}
