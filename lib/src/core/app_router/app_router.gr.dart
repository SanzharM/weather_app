// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardingSplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const OnboardingSplashScreen(),
      );
    },
    NavBarRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const NavBarScreen(),
      );
    },
    LocationPickerRoute.name: (routeData) {
      final args = routeData.argsAs<LocationPickerRouteArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: LocationPickerScreen(
          key: args.key,
          onPicked: args.onPicked,
        )),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          OnboardingSplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          NavBarRoute.name,
          path: '/nav-bar-screen',
        ),
        RouteConfig(
          LocationPickerRoute.name,
          path: '/location-picker-screen',
        ),
      ];
}

/// generated route for
/// [OnboardingSplashScreen]
class OnboardingSplashRoute extends PageRouteInfo<void> {
  const OnboardingSplashRoute()
      : super(
          OnboardingSplashRoute.name,
          path: '/',
        );

  static const String name = 'OnboardingSplashRoute';
}

/// generated route for
/// [NavBarScreen]
class NavBarRoute extends PageRouteInfo<void> {
  const NavBarRoute()
      : super(
          NavBarRoute.name,
          path: '/nav-bar-screen',
        );

  static const String name = 'NavBarRoute';
}

/// generated route for
/// [LocationPickerScreen]
class LocationPickerRoute extends PageRouteInfo<LocationPickerRouteArgs> {
  LocationPickerRoute({
    Key? key,
    required void Function(LocationEntity) onPicked,
  }) : super(
          LocationPickerRoute.name,
          path: '/location-picker-screen',
          args: LocationPickerRouteArgs(
            key: key,
            onPicked: onPicked,
          ),
        );

  static const String name = 'LocationPickerRoute';
}

class LocationPickerRouteArgs {
  const LocationPickerRouteArgs({
    this.key,
    required this.onPicked,
  });

  final Key? key;

  final void Function(LocationEntity) onPicked;

  @override
  String toString() {
    return 'LocationPickerRouteArgs{key: $key, onPicked: $onPicked}';
  }
}
