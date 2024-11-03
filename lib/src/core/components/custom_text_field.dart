import 'package:flutter/material.dart';
import 'package:flutter_dev_test/src/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final bool obscureText;
  final Color? fontColor;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    this.fontColor,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w500,
        color: fontColor,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
          color: fontColor?.withOpacity(0.9),
        ),
        filled: true,
        fillColor: AppColors.grey_light,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
