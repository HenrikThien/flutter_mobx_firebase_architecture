import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'ui_store.g.dart';

class UIStore = UIStoreBase with _$UIStore;

abstract class UIStoreBase with Store {
  @observable
  FirebaseUser user;

  @computed
  String get userDisplayName => (user.displayName.isNotEmpty) ? user.displayName : user.email;

  @action
  Future<void> initialize() async {
    // initialize some UI stuff like theme settings..
  }
}
