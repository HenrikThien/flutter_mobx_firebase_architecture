import 'package:mobx_firebase/stores/auth_store.dart';
import 'package:mobx_firebase/stores/ui_store.dart';

class DomainStore {
  AuthStore _authStore;

  DomainStore() {
    _authStore = AuthStore(this);
  }

  Future<void> initialize() async {
    await _authStore.initialize();
  }

  void dispose() {}
}
