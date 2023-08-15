import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/src/domain/blocs/settings/settings_bloc.dart';

extension XBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);

  FocusScopeNode get focus => FocusScope.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeMode get themeMode => read<SettingsBloc>().state.theme;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: theme.primaryColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.all(16.w),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: theme.textTheme.bodyLarge?.apply(
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            // SizedBox(
            //   width: 18.w,
            //   height: 18.w,
            //   child: AppIconButton.close(
            //     color: theme.scaffoldBackgroundColor,
            //     onPressed: () {
            //       ScaffoldMessenger.of(this).removeCurrentSnackBar();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

extension XLocationPermission on LocationPermission {
  bool get isDenied => this == LocationPermission.denied;
  bool get isDeniedForever => this == LocationPermission.deniedForever;
  bool get isAlways => this == LocationPermission.always;
  bool get isWhileInUse => this == LocationPermission.whileInUse;

  bool get isAllowed => isAlways || isWhileInUse;
  bool get isNotAllowed => isDenied || isDeniedForever;
}

extension XMapController on MapController {
  void animatedMove({
    required LatLng destLocation,
    required double destZoom,
    required TickerProvider vsync,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    try {
      final latTween = Tween<double>(
        begin: center.latitude,
        end: destLocation.latitude,
      );
      final lngTween = Tween<double>(
        begin: center.longitude,
        end: destLocation.longitude,
      );
      final zoomTween = Tween<double>(
        begin: zoom,
        end: destZoom,
      );

      final controller = AnimationController(duration: duration, vsync: vsync);
      final Animation<double> animation =
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

      controller.addListener(() {
        move(
          LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
          zoomTween.evaluate(animation),
        );
      });

      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        } else if (status == AnimationStatus.dismissed) {
          controller.dispose();
        }
      });

      controller.forward();
    } catch (e) {
      move(destLocation, destZoom);
    }
  }
}
