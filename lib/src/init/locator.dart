import 'package:get_it/get_it.dart';
import 'package:potato/src/stores/app_store.dart';
import 'package:potato/src/stores/auth_store.dart';
import 'package:potato/src/stores/notes_store.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
// Don't think we need ro register it, since we access from `AppStore`
  locator.registerLazySingleton<AuthStore>(() => AuthStore());
  locator.registerLazySingleton<AppStore>(() => AppStore());
  locator.registerLazySingleton<NotesStore>(() => NotesStore());
}
