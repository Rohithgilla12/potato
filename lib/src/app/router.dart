import 'package:auto_route/auto_route.dart';
import 'package:potato/src/screens/auth/login.dart';
import 'package:potato/src/screens/auth/sign_up.dart';
import 'package:potato/src/screens/dashboard/dashboard.dart';
import 'package:potato/src/screens/dashboard/new_note_screen.dart';
import 'package:potato/src/screens/dashboard/notes/note_detail_page.dart';
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
    // Todo add auth guards later :p
    AutoRoute(
      path: '/dashboard',
      page: DashboardPage,
    ),
    AutoRoute(
      path: '/new-note',
      page: NewNotePage,
    ),
    AutoRoute(
      path: '/note-detail/:id',
      page: NoteDetailPage,
    ),
  ],
)
class $AppRouter {}
