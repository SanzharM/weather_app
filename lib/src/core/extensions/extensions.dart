import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/domain/blocs/settings/settings_bloc.dart';

extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  FocusScopeNode get focus => FocusScope.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeMode get themeMode => read<SettingsBloc>().state.theme;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: theme.primaryColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.all(16.w),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: theme.textTheme.bodyLarge?.apply(
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            // SizedBox(
            //   width: 18.w,
            //   height: 18.w,
            //   child: AppIconButton.close(
            //     color: theme.scaffoldBackgroundColor,
            //     onPressed: () {
            //       ScaffoldMessenger.of(this).removeCurrentSnackBar();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
