import 'package:mobx_firebase/stores/auth_store.dart';
import 'package:mobx_firebase/stores/list_store.dart';

class DomainStore {
  AuthStore _authStore;
  ListStore _listStore;

  AuthStore get authStore => _authStore;
  ListStore get listStore => _listStore;

  DomainStore() {
    _authStore = AuthStore(this);
    _listStore = ListStore(this);
  }

  Future<void> initialize() async {
    await _authStore.initialize();
  }

  void dispose() {}
}
