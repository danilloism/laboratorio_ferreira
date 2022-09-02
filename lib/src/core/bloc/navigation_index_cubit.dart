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
}
