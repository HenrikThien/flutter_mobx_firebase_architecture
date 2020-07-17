import 'package:mobx/mobx.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';
import 'package:mobx_firebase/stores/ui_store.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final DomainStore domainStore;
  AuthStoreBase(this.domainStore);

  @action
  Future<void> initialize() async {}

  @action
  Future<void> signIn() async {}
}
