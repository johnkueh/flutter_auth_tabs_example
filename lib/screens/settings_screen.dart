import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/auth/authentication_provider.dart';
import 'package:flutter_auth_tabs_example/theme/theme_colors.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';
import 'package:flutter_auth_tabs_example/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Settings",
              textAlign: TextAlign.center,
              style: ThemeFonts.headingThree,
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<AuthenticationProvider>(
                builder: (context, authProvider, child) {
              return PrimaryButton(
                isLoading: authProvider.isLoading,
                label: "Logout",
                onPressed: () async {
                  await context.read<AuthenticationProvider>().signOut();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
