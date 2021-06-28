import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/auth/authentication_provider.dart';
import 'package:flutter_auth_tabs_example/screens/home_screen.dart';
import 'package:flutter_auth_tabs_example/screens/loading_screen.dart';
import 'package:flutter_auth_tabs_example/screens/login_screen.dart';
import 'package:flutter_auth_tabs_example/screens/register_screen.dart';
import 'package:flutter_auth_tabs_example/screens/settings_screen.dart';
import 'package:flutter_auth_tabs_example/screens/task_detail_screen.dart';
import 'package:flutter_auth_tabs_example/screens/tasks_screen.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';

class RoutemasterApp extends StatefulWidget {
  const RoutemasterApp({Key? key}) : super(key: key);

  @override
  _RoutemasterAppState createState() => _RoutemasterAppState();
}

class _RoutemasterAppState extends State<RoutemasterApp> {
  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthenticationProvider>().authState;

    if (authState == AuthState.Unknown) {
      return LoadingScreen();
    }

    final loggedOutMap = RouteMap(
      onUnknownRoute: (route) {
        return Redirect("/login");
      },
      routes: {
        '/login': (_) => MaterialPage(child: LoginScreen()),
        '/register': (_) => MaterialPage(child: RegisterScreen()),
      },
    );

    final loggedInMap = RouteMap(
      onUnknownRoute: (route) {
        return Redirect("/");
      },
      routes: {
        '/': (_) => TabPage(
            child: HomeScreen(),
            paths: ['/tasks', '/settings'],
            pageBuilder: (child) => MaterialPage(child: child)),
        "/tasks": (_) => MaterialPage(child: TasksScreen()),
        "/tasks/1": (_) => MaterialPage(child: TaskDetailScreen()),
        "/settings": (_) => MaterialPage(child: SettingsScreen())
        // Regular app routes
      },
    );

    return MaterialApp.router(
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
          return authState == AuthState.Authenticated
              ? loggedInMap
              : loggedOutMap;
        }),
        routeInformationParser: RoutemasterParser());
  }
}
