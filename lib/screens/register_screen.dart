import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/theme/theme_colors.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';
import 'package:flutter_auth_tabs_example/theme/theme_input_decoration.dart';
import 'package:flutter_auth_tabs_example/widgets/button.dart';
import 'package:routemaster/routemaster.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                Routemaster.of(context).push('/');
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
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
                Text("Welcome!\nCreate your profile.",
                    style: ThemeFonts.headingThree),
                SizedBox(height: 30),
                TextField(
                  style: ThemeFonts.formInput,
                  decoration:
                      ThemeInputDecoration.formInput.copyWith(hintText: "Name"),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: ThemeFonts.formInput,
                  decoration: ThemeInputDecoration.formInput
                      .copyWith(hintText: "Email"),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  style: ThemeFonts.formInput,
                  decoration: ThemeInputDecoration.formInput
                      .copyWith(hintText: "Password"),
                ),
                SizedBox(height: 30),
                Button(
                  label: "Create your account",
                  variant: ButtonVariant.Primary,
                  onPressed: () {
                    print('Register');
                    // context.vRouter.pushReplacement("/weekly-tasks");
                  },
                )
              ],
            ),
          ),
        ));
  }
}
