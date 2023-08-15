import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/flutter_gen/generated/assets.gen.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String? name;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 32.h,
        ),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          color: context.theme.scaffoldBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    name ?? '',
                    style: context.theme.textTheme.bodyLarge,
                  ),
                ),
                SizedBox(width: 16.w),
                Assets.icons.search.svg(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
