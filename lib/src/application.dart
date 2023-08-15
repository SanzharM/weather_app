import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/domain/blocs/forecasts/forecasts_bloc.dart';
import 'package:weather_app/src/domain/blocs/geolocation/geolocation_bloc.dart';
import 'package:weather_app/src/domain/blocs/nav_bar/nav_bar_bloc.dart';
import 'package:weather_app/src/domain/blocs/settings/settings_bloc.dart';
import 'package:weather_app/src/presentation/theme/app_theme.dart';
import 'package:weather_app/src/service_locator.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  static const String title = 'WeatherApp';

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final AppRouter _appRouter = sl<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<SettingsBloc>(
          lazy: false,
          create: (_) => SettingsBloc()..initial(),
        ),
        BlocProvider<NavBarBloc>(
          lazy: false,
          create: (_) => NavBarBloc(),
        ),
        BlocProvider<ForecastsBloc>(
          lazy: false,
          create: (_) => ForecastsBloc()..getLocations(),
        ),
        BlocProvider<GeolocationBloc>(
          lazy: false,
          create: (_) => GeolocationBloc()..initial(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: Application.title,

                // Routing
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),

                // Localization
                locale: state.locale,
                supportedLocales: L10n.supportedLocales,
                localizationsDelegates: L10n.delegates,

                // Theme
                theme: AppTheme.mainTheme(),
                darkTheme: AppTheme.mainTheme(),
                themeMode: state.theme,
                themeAnimationCurve: Curves.easeInOut,
                themeAnimationDuration: const Duration(milliseconds: 300),
              );
            },
          );
        },
      ),
    );
  }
}
