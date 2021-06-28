import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme_colors.dart';
import '../theme/theme_fonts.dart';
import 'button.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key, required this.label, this.isLoading, this.onPressed})
      : super(key: key);

  final String label;
  final bool? isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Ink(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading == true
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ThemeColors.neutralBlack,
                      strokeWidth: 2.0,
                    ),
                  )
                : Text(label,
                    textAlign: TextAlign.center, style: ThemeFonts.buttonOne),
          ],
        ),
        height: ButtonHeight,
        decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.neutralBlack),
            borderRadius: BorderRadius.circular(ButtonBorderRadius)),
      ),
    );
  }
}
