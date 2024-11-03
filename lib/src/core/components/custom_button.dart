import 'package:flutter/material.dart';
import 'package:flutter_dev_test/src/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color backgroundColor;
  final bool disabled;
  final BorderRadiusGeometry borderRadius;
  final double fontSize;
  final Color fontColor;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.backgroundColor = AppColors.brown,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.fontColor = Colors.white,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: disabled ? null : onPressed,
      color: backgroundColor,
      disabledColor: backgroundColor.withOpacity(0.5),
      height: 48,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
