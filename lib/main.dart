import 'package:flutter/material.dart';
import 'package:potato/src/app/router.gr.dart';
import 'package:potato/src/init/init.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

final AppRouter appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Potato',
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      theme: ThemeData.dark(),
    );
  }
}
