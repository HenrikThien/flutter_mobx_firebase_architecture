import 'package:firebase_database/firebase_database.dart';

class TodoItem {
  final String title;
  final String body;

  const TodoItem({this.title, this.body});

  factory TodoItem.fromSnapshot(DataSnapshot snapshot) {
    return TodoItem(
      title: snapshot.key,
      body: snapshot.value,
    );
  }
}