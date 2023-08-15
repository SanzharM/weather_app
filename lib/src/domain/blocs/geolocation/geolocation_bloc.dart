import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/common/state_status/state_status.dart';
import 'package:weather_app/src/core/extensions/extensions.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  void initial() => add(GeolocationInitialEvent());

  GeolocationBloc() : super(const GeolocationState()) {
    on<GeolocationInitialEvent>(_initial);
  }

  final GeocodingPlatform geocoding = GeocodingPlatform.instance;

  void _initial(
    GeolocationInitialEvent event,
    Emitter<GeolocationState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission.isNotAllowed) {
        permission = await Geolocator.requestPermission();
        if (permission.isNotAllowed) {
          return emit(state.copyWith(
            status: StateStatus.error,
            permission: permission,
            message: L10n.current.error,
          ));
        }
      }

      final Position currentPosition = await Geolocator.getCurrentPosition();
      final LatLng currentLocation = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      return emit(state.copyWith(
        status: StateStatus.success,
        permission: permission,
        currentLocation: currentLocation,
      ));
    } catch (e) {
      debugPrint('GeolocationInitialEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
