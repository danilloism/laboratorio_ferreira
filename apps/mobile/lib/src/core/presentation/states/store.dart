import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Store<T> extends FamilyNotifier<List<T>, Iterable<T>> {
  @override
  List<T> build([Iterable<T>? arg]) {
    _items = arg?.toSet() ?? {};
    return [..._items];
  }

  late final Set<T> _items;

  bool get isEmpty => state.isEmpty;
  int get length => state.length;
  List<T> get items => UnmodifiableListView(state);

  void add(T item) => state = [..._items..add(item)];

  void addAll(Iterable<T> items) => state = [..._items..addAll(items)];

  bool contains(T item) => state.contains(item);

  void update({required T oldValue, required T newValue}) {
    final itemsList = [..._items];
    final index = itemsList.indexOf(oldValue);

    itemsList[index] = newValue;

    state = [...itemsList];
  }
}
