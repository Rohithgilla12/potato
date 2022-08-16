import 'package:auto_route/auto_route.dart';
import 'package:potato/src/screens/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
  ],
)
class $AppRouter {}
