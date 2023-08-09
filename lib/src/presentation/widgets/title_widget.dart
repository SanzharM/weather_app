import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.titleStyle,
  });

  final String title;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle,
    );
  }
}
