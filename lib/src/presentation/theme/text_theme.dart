import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/flutter_gen/generated/colors.gen.dart';

class AppTextTheme {
  Color color = Color(0xFF0256A5);
  static const String fontFamily = 'Roboto';

  static const TextStyle _primaryStyle = TextStyle(
    fontFamily: fontFamily,
    color: ColorName.black,
  );

  static TextTheme theme({Color? color}) => TextTheme(
        // Headlines
        headlineLarge: _primaryStyle.copyWith(
          fontSize: 24.0.spMin,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        headlineMedium: _primaryStyle.copyWith(
          fontSize: 20.0.spMin,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        // headlineSmall:

        // Subtitles
        // titleLarge:
        titleMedium: _primaryStyle.copyWith(
          fontSize: 16.0.spMin,
          fontWeight: FontWeight.w600,
          color: color,
        ),
        titleSmall: _primaryStyle.copyWith(
          fontSize: 14.0.spMin,
          fontWeight: FontWeight.w600,
          color: color,
        ),

        // Body
        bodyLarge: _primaryStyle.copyWith(
          fontSize: 16.0.spMin,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodyMedium: _primaryStyle.copyWith(
          fontSize: 14.0.spMin,
          fontWeight: FontWeight.w400,
          color: color,
        ),
        bodySmall: _primaryStyle.copyWith(
          fontSize: 12.0.spMin,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      );

  static final CupertinoTextThemeData cupertinoTextTheme = CupertinoTextThemeData(
    textStyle: TextStyle(
      fontSize: 16.w,
      fontFamily: fontFamily,
      color: ColorName.black,
    ),
  );
}
