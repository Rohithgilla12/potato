// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../screens/auth/login.dart' as _i2;
import '../screens/auth/sign_up.dart' as _i3;
import '../screens/dashboard/dashboard.dart' as _i4;
import '../screens/dashboard/new_note_screen.dart' as _i5;
import '../screens/dashboard/notes/note_detail_page.dart' as _i6;
import '../screens/home.dart' as _i1;
import 'guards/auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter(
      {_i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    SignUpRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignUpPage());
    },
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DashboardPage());
    },
    NewNoteRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NewNotePage());
    },
    NoteDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NoteDetailRouteArgs>(
          orElse: () => NoteDetailRouteArgs(id: pathParams.getString('id')));
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.NoteDetailPage(key: args.key, id: args.id));
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/'),
        _i7.RouteConfig(LoginRoute.name, path: '/login'),
        _i7.RouteConfig(SignUpRoute.name, path: '/sign-up'),
        _i7.RouteConfig(DashboardRoute.name,
            path: '/dashboard', guards: [authGuard]),
        _i7.RouteConfig(NewNoteRoute.name,
            path: '/new-note', guards: [authGuard]),
        _i7.RouteConfig(NoteDetailRoute.name,
            path: '/note-detail/:id', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute() : super(DashboardRoute.name, path: '/dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i5.NewNotePage]
class NewNoteRoute extends _i7.PageRouteInfo<void> {
  const NewNoteRoute() : super(NewNoteRoute.name, path: '/new-note');

  static const String name = 'NewNoteRoute';
}

/// generated route for
/// [_i6.NoteDetailPage]
class NoteDetailRoute extends _i7.PageRouteInfo<NoteDetailRouteArgs> {
  NoteDetailRoute({_i8.Key? key, required String id})
      : super(NoteDetailRoute.name,
            path: '/note-detail/:id',
            args: NoteDetailRouteArgs(key: key, id: id),
            rawPathParams: {'id': id});

  static const String name = 'NoteDetailRoute';
}

class NoteDetailRouteArgs {
  const NoteDetailRouteArgs({this.key, required this.id});

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'NoteDetailRouteArgs{key: $key, id: $id}';
  }
}
