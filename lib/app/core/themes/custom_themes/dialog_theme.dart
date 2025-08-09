import 'package:flutter/material.dart';

class NDialogTheme {
  NDialogTheme._();

  static const  lightDialogTheme = DialogThemeData(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
    contentTextStyle: TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.w600),
    
  );
  static const  darkDialogTheme = DialogTheme(
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
    contentTextStyle: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w600),
  );
}