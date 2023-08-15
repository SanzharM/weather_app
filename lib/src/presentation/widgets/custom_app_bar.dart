import 'package:flutter/material.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/presentation/widgets/buttons/app_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    this.needLeading = true,
    this.automaticallyImplyLeading = true,
    this.title,
    this.titleStyle,
    this.centerTitle,
    this.actions = const [],
  }) : super(key: key);

  final Widget? leading;
  final bool needLeading;
  final bool automaticallyImplyLeading;
  final String? title;
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final List<Widget> actions;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: needLeading
          ? leading ?? AppIconButton.back(onPressed: context.router.pop<void>)
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title?.isEmpty ?? true ? null : Text(title!),
      titleTextStyle: titleStyle,
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}
