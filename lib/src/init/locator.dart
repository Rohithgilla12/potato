import 'package:get_it/get_it.dart';
import 'package:potato/src/stores/app_store.dart';
import 'package:potato/src/stores/auth_store.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AuthStore>(() => AuthStore());
  locator.registerLazySingleton<AppStore>(() => AppStore());
}
