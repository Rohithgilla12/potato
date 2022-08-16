import 'package:mobx/mobx.dart';
import 'package:potato/src/stores/auth_store.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final auth = AuthStore();

  @observable
  bool isLoading = false;
}
