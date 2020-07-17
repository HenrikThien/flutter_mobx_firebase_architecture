import 'package:get_it/get_it.dart';
import 'package:mobx_firebase/services/auth_service.dart';
import 'package:mobx_firebase/stores/domain_stores.dart';
import 'package:mobx_firebase/stores/ui_store.dart';

GetIt locator = GetIt.instance;

Future<void> registerInstances() async {
  locator.registerFactory(() => AuthService());

  locator.registerSingletonAsync(() async {
    final uiStore = UIStore();
    await uiStore.initialize();
    return uiStore;
  });

  locator.registerSingletonAsync(() async {
    final domainStore = DomainStore();
    await domainStore.initialize();
    return domainStore;
  }, dependsOn: [UIStore]);
}
