import 'package:flutter/material.dart';

import 'package:weather_app/src/core/extensions/extensions.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.title,
    this.textAlign = TextAlign.left,
    this.titleStyle,
    this.color,
    this.weight,
  }) : super(key: key);

  final String title;
  final TextAlign textAlign;
  final TextStyle? titleStyle;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: 1,
      style: titleStyle ??
          context.theme.textTheme.headlineMedium?.copyWith(
            color: color,
            fontWeight: weight,
          ),
    );
  }
}
