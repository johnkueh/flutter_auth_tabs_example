import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/theme/theme_colors.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';

class TaskDetailScreen extends StatefulWidget {
  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Task Detail",
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
              "Some info for this task",
              textAlign: TextAlign.center,
              style: ThemeFonts.headingThree,
            ),
          ],
        ),
      ),
    );
  }
}
