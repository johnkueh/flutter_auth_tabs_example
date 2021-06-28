import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/auth/auth_error_alert_dialog.dart';
import 'package:flutter_auth_tabs_example/auth/authentication_provider.dart';
import 'package:flutter_auth_tabs_example/theme/theme_colors.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';
import 'package:flutter_auth_tabs_example/theme/theme_input_decoration.dart';
import 'package:flutter_auth_tabs_example/widgets/button.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Tabs Example",
              style: ThemeFonts.headingFive
                  .copyWith(color: ThemeColors.neutralBlack)),
          backgroundColor: Colors.white,
          elevation: 0.5,
          actions: [
            GestureDetector(
              onTap: () {
                Routemaster.of(context).push('/register');
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register",
                      style: ThemeFonts.buttonOne
                          .copyWith(color: ThemeColors.primaryBlue[600]),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Welcome back!", style: ThemeFonts.headingThree),
                SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: ThemeFonts.formInput,
                  decoration: ThemeInputDecoration.formInput
                      .copyWith(hintText: "Email"),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: ThemeFonts.formInput,
                  decoration: ThemeInputDecoration.formInput
                      .copyWith(hintText: "Password"),
                ),
                SizedBox(height: 30),
                Consumer<AuthenticationProvider>(
                  builder: (context, authProvider, child) {
                    return Button(
                      label: "Sign in",
                      isLoading: authProvider.isLoading,
                      variant: ButtonVariant.Primary,
                      onPressed: () async {
                        final errorMessage =
                            await context.read<AuthenticationProvider>().signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                        if (errorMessage == null) {
                          // context.vRouter.pushReplacement("/tabs/tasks");
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AuthErrorAlertDialog());
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
