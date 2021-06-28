import 'package:flutter/material.dart';
import './secondary_button.dart';
import './primary_button.dart';

const ButtonHeight = 48.0;
const ButtonBorderRadius = 6.0;
enum ButtonVariant { Primary, Secondary }

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.label,
      this.isLoading = false,
      this.variant = ButtonVariant.Primary,
      this.onPressed})
      : super(key: key);

  final String label;
  final ButtonVariant? variant;
  final bool? isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (variant == ButtonVariant.Secondary) {
      return SecondaryButton(
          label: label,
          isLoading: isLoading,
          onPressed: isLoading != true ? onPressed : null);
    }
    return PrimaryButton(
        label: label,
        isLoading: isLoading,
        onPressed: isLoading != true ? onPressed : null);
  }
}
