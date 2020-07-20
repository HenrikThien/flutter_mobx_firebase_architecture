import 'package:flutter/material.dart';
import 'package:mobx_firebase/locator.dart';
import 'package:mobx_firebase/ui/root_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerInstances();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Mobx Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootPage(),
    );
  }
}
