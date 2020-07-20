import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/models/todo_item.dart';
import 'package:mobx_firebase/repositories/todo_list_repository.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';

part 'list_store.g.dart';

class ListStore = ListStoreBase with _$ListStore;

abstract class ListStoreBase with Store {
  final DomainStore domainStore;
  final TodoListRepository _repo = locator<TodoListRepository>();

  StreamSubscription _onItemAdded;
  StreamSubscription _onItemRemoved;
  StreamSubscription _onItemChanged;

  ObservableList<TodoItem> items = ObservableList();

  ListStoreBase(this.domainStore);

  @action
  Future<void> listen() async {
    items.clear();
    
    await _fetchAllItems();

    _onItemAdded = _repo.onItemAdded().listen((event) {
      var item = TodoItem.fromSnapshot(event.snapshot);
      if (items.where((e) => e.title == item.title).length == 0) {
        items.add(item);
      }
    });
    _onItemRemoved = _repo.onItemRemoved().listen((event) {
      var item = TodoItem.fromSnapshot(event.snapshot);
      items.removeWhere((e) => e.title == item.title);
    });
    _onItemChanged = _repo.onItemChanged().listen((event) {
      var item = TodoItem.fromSnapshot(event.snapshot);
      items.removeWhere((e) => e.title == item.title);
      items.add(item);
    });
  }

  Future<void> _fetchAllItems() async {
    final snapshot = await _repo.fetchItems();
    if (snapshot.value != null) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) { 
        var item = TodoItem(title: key, body: value);
        items.add(item);
      });
    }
  }

  void dispose() {
    _onItemAdded?.cancel();
    _onItemRemoved?.cancel();
    _onItemChanged?.cancel();
  }
}