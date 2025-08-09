import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ThemeHelper on ThemeData {
  SystemUiOverlayStyle get systemUiOverlayStyle {
    return brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
  }
}
