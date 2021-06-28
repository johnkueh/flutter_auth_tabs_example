import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/theme/theme_colors.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
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
              "Page 1",
              textAlign: TextAlign.center,
              style: ThemeFonts.headingThree,
            ),
          ],
        ),
      ),
    );
  }
}
