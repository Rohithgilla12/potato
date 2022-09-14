import 'package:auto_route/auto_route.dart';
import 'package:crispin/crispin.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:potato/src/init/init.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // Read the userProvider here and check if the user is logged in
    // if not, redirect to login page
    // if yes, call resolver.next()
    final context = router.navigatorKey.currentContext!;
    final String? uid = ProviderScope.containerOf(context, listen: false).read(uidProvider);

    Crispin().info(uid ?? 'No user found');

    if (uid == null) {
      router.pushNamed('/login');
    } else {
      resolver.next();
    }
  }
}
