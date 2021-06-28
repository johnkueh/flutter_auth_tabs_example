import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/navigation/bottom_tab_bar.dart';
import 'package:flutter_auth_tabs_example/screens/settings_screen.dart';
import 'package:vrouter/vrouter.dart';
import 'package:flutter_auth_tabs_example/screens/login_screen.dart';
import 'package:flutter_auth_tabs_example/screens/register_screen.dart';
import 'package:flutter_auth_tabs_example/screens/tasks_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter_auth_tabs_example/auth/authentication_provider.dart';

class VRouterApp extends StatefulWidget {
  const VRouterApp({Key? key}) : super(key: key);

  @override
  _VRouterAppState createState() => _VRouterAppState();
}

class _VRouterAppState extends State<VRouterApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final authProvider = context.read<AuthenticationProvider>();

      FirebaseAuth.instance.idTokenChanges().listen((user) {
        if (user != null) {
          authProvider.setAuthState(AuthState.Authenticated);
        } else {
          authProvider.setAuthState(AuthState.Unauthenticated);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authProvider, child) {
      if (authProvider.authState == AuthState.Unknown) {
        print('unkown');
        return Container(
          color: Colors.white,
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      }

      return VRouter(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialUrl: "/tabs/tasks",
        routes: [
          VWidget(
              path: '/login',
              widget: LoginScreen(),
              buildTransition: (animation, _, child) =>
                  FadeTransition(opacity: animation, child: child)),
          VWidget(
              path: '/register',
              widget: RegisterScreen(),
              buildTransition: (animation, _, child) =>
                  FadeTransition(opacity: animation, child: child)),
          VGuard(
              beforeEnter: (vRedirector) async {
                switch (authProvider.authState) {
                  case AuthState.Unauthenticated:
                    vRedirector.push("/login");
                    break;
                  default:
                    break;
                }
              },
              stackedRoutes: [
                VNester(
                    path: '/tabs',
                    widgetBuilder: (child) => Scaffold(
                        body: child, bottomNavigationBar: BottomTabBar()),
                    buildTransition: (animation, _, child) =>
                        FadeTransition(opacity: animation, child: child),
                    nestedRoutes: [
                      VWidget(
                          path: 'tasks',
                          widget: TasksScreen(),
                          transitionDuration: Duration(milliseconds: 0)),
                      VWidget(
                        path: 'settings',
                        widget: SettingsScreen(),
                        transitionDuration: Duration(milliseconds: 0),
                      )
                    ])
              ])
        ],
      );
    });
  }
}
