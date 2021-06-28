import 'package:flutter/material.dart';

class AuthErrorAlertDialog extends StatelessWidget {
  const AuthErrorAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error"),
      content: Text(
          "Sorry, but we could not find any account with this email/password combination"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
            },
            child: Text("Ok, got it!"))
      ],
    );
  }
}
