import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
    this.size,
    this.color,
  });

  /// Default is 10.w
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? context.theme.primaryColor,
        radius: size ?? 10.w,
      ),
    );
  }
}
