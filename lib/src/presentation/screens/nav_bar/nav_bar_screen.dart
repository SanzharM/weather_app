import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/flutter_gen/generated/assets.gen.dart';
import 'package:weather_app/src/core/flutter_gen/generated/colors.gen.dart';
import 'package:weather_app/src/core/utils/utils.dart';
import 'package:weather_app/src/domain/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:weather_app/src/presentation/screens/forecast_screen/forecasts_screen.dart';
import 'package:weather_app/src/presentation/screens/settings/settings_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (context, state) {
        Widget getChild() {
          switch (state.index) {
            case 0:
              return const ForecastsScreen();
            case 1:
              return const SettingsScreen();
            default:
              return const ForecastsScreen();
          }
        }

        Color getColor(int index) {
          if (index == state.index) {
            return context.theme.primaryColor;
          }
          return ColorName.mainGrey;
        }

        return Scaffold(
          body: AnimatedSwitcher(
            duration: Utils.animationDuration,
            child: getChild(),
          ),
          bottomNavigationBar: CupertinoTabBar(
            currentIndex: state.index,
            onTap: context.read<NavBarBloc>().changeIndex,
            backgroundColor: context.theme.scaffoldBackgroundColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet, color: getColor(0)),
              ),
              BottomNavigationBarItem(
                icon: Assets.icons.settings.svg(color: getColor(1)),
              ),
            ],
          ),
        );
      },
    );
  }
}
