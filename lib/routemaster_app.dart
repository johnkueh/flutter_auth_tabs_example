import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/auth/authentication_provider.dart';
import 'package:flutter_auth_tabs_example/screens/loading_screen.dart';
import 'package:flutter_auth_tabs_example/screens/login_screen.dart';
import 'package:flutter_auth_tabs_example/screens/register_screen.dart';
import 'package:flutter_auth_tabs_example/screens/settings_screen.dart';
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

    print(authState);

    final loadingMap = RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: LoadingScreen()),
      },
    );

    final loggedOutMap = RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: LoginScreen()),
        '/register': (_) => MaterialPage(child: RegisterScreen()),
      },
    );

    final loggedInMap = RouteMap(
      routes: {
        '/': (_) => MaterialPage(child: SettingsScreen()),
        // Regular app routes
      },
    );

    return MaterialApp.router(
        routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
          switch (authState) {
            case AuthState.Authenticated:
              return loggedInMap;
            case AuthState.Unauthenticated:
              return loggedOutMap;
            case AuthState.Unknown:
              return loadingMap;
          }
        }),
        routeInformationParser: RoutemasterParser());
  }
}
