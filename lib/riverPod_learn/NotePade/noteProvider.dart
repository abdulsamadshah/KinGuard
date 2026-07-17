import 'package:flutter_riverpod/legacy.dart';

final noteProvider = StateNotifierProvider<noteNotifier, List<Item>>((ref) {
  return noteNotifier();
});

class noteNotifier extends StateNotifier<List<Item>> {
  noteNotifier() : super([]);

  void addItem({required String name}) {
    final item = Item(id: DateTime.now().millisecond.toString(), name: name);
    state.add(item);
    state = state.toList();
  }

  void deleteItem({required String id}) {
    state.removeWhere((element) => element.id == id);
    state = state.toList();
  }

  void updateItem({required String name,required String id}) {
    var foundIndex= state.indexWhere((element) => element.id == id);
    state[foundIndex].name=name;
    state = state.toList();
  }
}

class Item {
  String id;
  String name;

  Item({required this.name, required this.id});
}
