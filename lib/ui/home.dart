import 'package:flutter/material.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';
import 'package:mobx_firebase/stores/ui_store.dart';
import 'package:mobx_firebase/ui/list/todo_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final uiStore = locator<UIStore>();
  final authStore = locator<DomainStore>().authStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Welcome back,\n ${uiStore.userDisplayName}!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Realtime Database"),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TodoListPage()),
                        );
                      },
                    ),
                    RaisedButton(
                      child: Text("Logout"),
                      onPressed: () async {
                        await authStore.signOut();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}