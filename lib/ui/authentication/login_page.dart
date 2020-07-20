import 'package:flutter/material.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Sign in", style: TextStyle(fontSize: 22),),
            RaisedButton(
              onPressed: () async {
                final store = locator<DomainStore>().authStore;
                await store.signIn();
              },
              child: Text("Sign in with Google"),
              color: Colors.red[300],
            ),
          ],
        ),
      ),
    );
  }
}