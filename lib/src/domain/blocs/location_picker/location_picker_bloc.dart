import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';

part 'location_picker_event.dart';
part 'location_picker_state.dart';

class LocationPickerBloc extends Bloc<LocationPickerEvent, LocationPickerState> {
  void pick(LatLng location, {String? localeIdentifier}) =>
      add(LocationPickerPickEvent(location, localeIdentifier: localeIdentifier));

  LocationPickerBloc() : super(LocationPickerInitial()) {
    on<LocationPickerPickEvent>(_pick);
  }

  final GeocodingPlatform _geocoding = GeocodingPlatform.instance;

  void _pick(
    LocationPickerPickEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    try {
      emit(LocationPickerLoading());

      List<Placemark> placemarks = await _geocoding.placemarkFromCoordinates(
        event.location.latitude,
        event.location.longitude,
        localeIdentifier: event.localeIdentifier,
      );
      if (placemarks.isEmpty) {
        return emit(LocationPickerError(L10n.current.locationNotFound));
      }
      final LocationEntity location = LocationEntity.fromPlacemark(
        placemark: placemarks.first,
        latitude: event.location.latitude,
        longitude: event.location.longitude,
      );
      if (location.name?.isEmpty ?? true) {
        return emit(LocationPickerError(L10n.current.locationNotFound));
      }
      emit(LocationPickerLoaded(location));
    } catch (e) {
      debugPrint('LocationPickerPickEvent error: $e');
      emit(LocationPickerError(L10n.current.somethingWentWrong));
    }
  }
}
