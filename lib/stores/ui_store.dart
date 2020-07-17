import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';

part 'ui_store.g.dart';

class UIStore = UIStoreBase with _$UIStore;

abstract class UIStoreBase with Store {
  @observable
  FirebaseUser user;

  @observable
  Brightness brightness;

  @action
  Future<void> initialize() async {
    brightness = Brightness.dark;
  }
}
