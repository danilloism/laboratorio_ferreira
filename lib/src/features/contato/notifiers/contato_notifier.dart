import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/state/contato_state.dart';

class ContatoNotifier extends StateNotifier<ContatoState> {
  ContatoNotifier() : super(const ContatoState());
}
