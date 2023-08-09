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
