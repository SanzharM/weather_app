import 'package:flutter/cupertino.dart';
import 'package:weather_app/src/core/flutter_gen/generated/assets.gen.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.padding,
    this.alignment = Alignment.center,
  });

  final Widget icon;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final Alignment alignment;

  factory AppIconButton.back({
    void Function()? onPressed,
    Color? color,
    Alignment alignment = Alignment.center,
  }) {
    return AppIconButton(
      alignment: alignment,
      icon: Assets.icons.arrowLeft.svg(color: color),
      onPressed: onPressed,
    );
  }
  factory AppIconButton.close({
    void Function()? onPressed,
    Color? color,
    Alignment alignment = Alignment.center,
  }) {
    return AppIconButton(
      alignment: alignment,
      icon: Assets.icons.close.svg(color: color),
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      alignment: alignment,
      padding: padding ?? EdgeInsets.zero,
      onPressed: onPressed,
      child: icon,
    );
  }
}
