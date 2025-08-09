import 'package:bus/app/core/constants/colors.dart';
import 'package:bus/app/core/extensions/color_helper.dart';
import 'package:bus/app/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? isObsecureText;
  final String? obscureCharacter;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isObsecureText = false,
    this.obscureCharacter = "*",
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required Null Function(dynamic _) onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObsecureText!,
      obscuringCharacter: obscureCharacter!,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 12),
        constraints: BoxConstraints(
          maxHeight: NHelperFunctions.screenHeight() * 0.065,
          maxWidth: NHelperFunctions.screenWidth(),
        ),
        filled: true,
        fillColor: Theme.of(context).fieldCustom,
        hintText: hintText,
        hintStyle: TextStyle(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: NColors.borderSecondary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
