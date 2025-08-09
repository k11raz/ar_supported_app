import 'package:bus/app/core/constants/colors.dart';
import 'package:flutter/material.dart';


extension CustomColorScheme on ThemeData {
  Color get primaryCustom =>
      brightness == Brightness.dark ? NColors.dark : NColors.primary;

  Color get backCustom =>
      brightness == Brightness.dark ? NColors.darkerGrey : NColors.third;

  Color get cardCustom =>
      brightness == Brightness.dark ? NColors.darkerGrey : NColors.third;

  Color get fieldCustom =>
      brightness == Brightness.dark ? NColors.black : NColors.white;

  Color get secondaryCustom =>
      brightness == Brightness.dark ? NColors.dark : NColors.primary;

  Color get thirdCustom =>
      brightness == Brightness.dark ? NColors.dark : NColors.third;

  Color get fCustom =>
      brightness == Brightness.dark ? NColors.dark : NColors.secondary;
}

// Color(0xFFE9EEF7)
