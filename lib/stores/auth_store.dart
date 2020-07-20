import 'package:mobx/mobx.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';

import '../locator.dart';
import '../services/auth_service.dart';
import 'ui_store.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final _authService = locator<AuthService>();
  final _uiStore = locator<UIStore>();

  final DomainStore domainStore;
  AuthStoreBase(this.domainStore);

  @action
  Future<void> initialize() async {
    await autoSignIn();
  }

  @action
  Future<bool> autoSignIn() async {
    final isSignedIn = await _authService.isSignedIn();
    if (isSignedIn) {
      _uiStore.user = await _authService.getCurrentUser();
    }
    return isSignedIn;
  }

  @action
  Future<void> signIn() async {
    final user = await _authService.signIn();
    _uiStore.user = user;
  }

  @action
  Future<void> signOut() async {
    await _authService.signOut();
    _uiStore.user = null;
  }
}
