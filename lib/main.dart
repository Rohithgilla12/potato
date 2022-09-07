import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:potato/src/app/guards/auth_guard.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/init.dart';
import 'package:potato/src/utils/riverpod_logger.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

final AppRouter appRouter = AppRouter(
  authGuard: AuthGuard(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      observers: [RiverpodLogger()],
      child: MaterialApp.router(
        title: 'Potato',
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
