import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laboratorio_ferreira_mobile/src/core/presentation/states/store.dart';
import 'package:laboratorio_ferreira_mobile/src/features/contato/domain/models/contato.dart';

final _contatosStore =
    NotifierProviderFamily<Store<Contato>, List<Contato>, Iterable<Contato>?>(
        Store.new);

final contatosStoreProvider = _contatosStore([]);
