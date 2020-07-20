import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/stores/ui_store.dart';
import 'package:mobx_firebase/ui/authentication/login_page.dart';
import 'package:mobx_firebase/ui/home.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Future _initFuture;

  @override
  void initState() {
    super.initState();
    _initFuture = Future.wait([
      locator.allReady(),
      Future.delayed(Duration(seconds: 2)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFuture,
      builder: (context, snapshot) {
        final store = locator<UIStore>();

        if (snapshot.connectionState == ConnectionState.done) {
          return Observer(
            builder: (context) {
              if (store.user != null) {
                return HomePage();
              }

              return LoginPage();
            },
          );
        }
        else if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return LoginPage();
      },
    );
  }
}
