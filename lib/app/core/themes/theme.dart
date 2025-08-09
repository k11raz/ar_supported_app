import 'package:bus/app/core/themes/custom_themes/appbar.dart';
import 'package:bus/app/core/themes/custom_themes/bottom_sheet.dart';
import 'package:bus/app/core/themes/custom_themes/checkbox.dart';
import 'package:bus/app/core/themes/custom_themes/chip.dart';
import 'package:bus/app/core/themes/custom_themes/elevated_button.dart';
import 'package:bus/app/core/themes/custom_themes/outlined_button.dart';
import 'package:bus/app/core/themes/custom_themes/text.dart';
import 'package:bus/app/core/themes/custom_themes/text_field.dart';
import 'package:flutter/material.dart';



class NAppTheme {
  NAppTheme._(); // private

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness:Brightness.light,
    primaryColor: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: NTextTheme.lightTextTheme,
    chipTheme: NChipTheme.lightChipTheme,
    appBarTheme: NAppBarTheme.lightAppBarTheme,
    checkboxTheme: NCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: NOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness:Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: NTextTheme.darkTextTheme,
    chipTheme: NChipTheme.darkChipTheme,
    appBarTheme: NAppBarTheme.darkAppBarTheme,
    checkboxTheme: NCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: NBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: NElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: NOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: NTextFormFieldTheme.darkInputDecorationTheme
  );
}