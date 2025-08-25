import 'package:bus/app/core/constants/colors.dart';
import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isObsecureText;
  final String obscureCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final String? Function(dynamic)? validator;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isObsecureText = false,
    this.obscureCharacter = "*",
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObsecureText,
      obscuringCharacter: obscureCharacter,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 12),
        filled: true,
        fillColor: Theme.of(context).fieldCustom,
        hintText: hintText,
        hintStyle: const TextStyle(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
