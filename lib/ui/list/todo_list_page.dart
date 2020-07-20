
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final listStore = locator<DomainStore>().listStore;

  @override
  void initState() { 
    super.initState();
    listStore.listen();
  }

  @override
  void dispose() { 
    listStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste"),
      ),
      body: Container(
        child: Observer(
          builder: (context) => ListView.builder(
            itemCount: listStore.items.length,
            itemBuilder: (context,index) {
              final item = listStore.items[index];

              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text(item.body),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}