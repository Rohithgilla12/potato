import 'package:auto_route/auto_route.dart';
import 'package:potato/src/screens/auth/login.dart';
import 'package:potato/src/screens/auth/sign_up.dart';
import 'package:potato/src/screens/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/sign-up',
      page: SignUpPage,
    ),
  ],
)
class $AppRouter {}
