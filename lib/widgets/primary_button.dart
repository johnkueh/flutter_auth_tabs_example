import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_tabs_example/theme/theme_fonts.dart';

import '../theme/theme_colors.dart';
import 'button.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
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
                      color: Colors.white,
                      strokeWidth: 2.0,
                    ),
                  )
                : Text(
                    label,
                    textAlign: TextAlign.center,
                    style: ThemeFonts.buttonOne
                        .copyWith(color: ThemeColors.neutralWhite),
                  ),
          ],
        ),
        height: ButtonHeight,
        decoration: BoxDecoration(
            color: isLoading == true
                ? ThemeColors.primaryBlue[600]?.withOpacity(0.3)
                : ThemeColors.primaryBlue[600],
            borderRadius: BorderRadius.circular(ButtonBorderRadius)),
      ),
    );
  }
}
