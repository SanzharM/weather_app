import 'package:flutter/material.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/presentation/widgets/title_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TitleWidget(
                title: L10n.of(context).settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
