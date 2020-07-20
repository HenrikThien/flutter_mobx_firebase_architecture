import 'package:firebase_database/firebase_database.dart';
import 'package:mobx_firebase/models/todo_item.dart';

class TodoListRepository {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference get _ref => database.reference().child('items');

  Future<void> addItem(TodoItem item) {

  }

  Future<void> deleteItem(TodoItem item) {
    
  }

  Future<DataSnapshot> fetchItems() async {
    return await _ref.once();
  }

  Stream<Event> onItemAdded() {
    return _ref.onChildAdded;
  }

  Stream<Event> onItemRemoved() {
    return _ref.onChildRemoved;
  }

  Stream<Event> onItemChanged() {
    return _ref.onChildChanged;
  }
}