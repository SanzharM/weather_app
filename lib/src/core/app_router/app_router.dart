import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';
import 'package:weather_app/src/presentation/screens/location_picker/location_picker_screen.dart';
import 'package:weather_app/src/presentation/screens/nav_bar/nav_bar_screen.dart';
import 'package:weather_app/src/presentation/screens/onboarding/onboarding_splash_screen.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(page: OnboardingSplashScreen, initial: true),
    AutoRoute(page: NavBarScreen),
    AutoRoute(page: LocationPickerScreen),
  ],
)
class AppRouter extends _$AppRouter {}
