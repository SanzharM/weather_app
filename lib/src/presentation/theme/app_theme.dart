import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:weather_app/src/presentation/theme/text_theme.dart';

class AppTheme {
  static ThemeData mainTheme() {
    return ThemeData(
      textTheme: AppTextTheme.theme(),
      fontFamily: AppTextTheme.fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorName.blue,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: Color(0xfffafafa),
        titleTextStyle: AppTextTheme.theme().headlineMedium,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorName.black,
          size: 24.sp,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      iconTheme: IconThemeData(
        color: ColorName.black,
        size: 24.sp,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      textTheme: AppTextTheme.theme(),
      fontFamily: AppTextTheme.fontFamily,
      scaffoldBackgroundColor: ColorName.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorName.blueDark,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: ColorName.black,
        titleTextStyle: AppTextTheme.theme().headlineMedium,
        elevation: 0,
        iconTheme: IconThemeData(
          color: ColorName.white,
          size: 24.sp,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      iconTheme: IconThemeData(
        color: ColorName.white,
        size: 24.sp,
      ),
    );
  }
}
