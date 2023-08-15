import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_app/src/common/state_status/state_status.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/core/local_storage/local_storage.dart';
import 'package:weather_app/src/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';
import 'package:weather_app/src/domain/usecases/get_forecast/get_forecast_usecase.dart';
import 'package:weather_app/src/service_locator.dart';

part 'forecasts_event.dart';
part 'forecasts_state.dart';

class ForecastsBloc extends Bloc<ForecastsEvent, ForecastsState> {
  void getLocations() => add(ForecastsGetLocationsEvent());

  void getForecast({
    required LatLng location,
    int? forecastDays,
    int? pastDays,
  }) =>
      add(ForecastsGetForecastEvent(
        latitude: location.latitude,
        longitude: location.longitude,
        forecastDays: forecastDays,
        pastDays: pastDays,
      ));

  ForecastsBloc() : super(const ForecastsState()) {
    on<ForecastsGetLocationsEvent>(_getLocations);
    on<ForecastsGetForecastEvent>(_getForecast);
  }

  final _getForecastUseCase = sl<GetForecastUseCase>();
  final _storage = sl<LocalStorage>();

  void _getLocations(
    ForecastsGetLocationsEvent event,
    Emitter<ForecastsState> emit,
  ) async {
    emit(state.copyWith(status: StateStatus.loading));

    final List<LocationEntity> locations = await _storage.getLocations();
    final List<ForecastEntity> tempForecasts = List<ForecastEntity>.filled(
      locations.length,
      const ForecastEntity(),
    );

    return emit(state.copyWith(
      status: StateStatus.success,
      locations: locations,
      forecasts: tempForecasts,
    ));
  }

  void _getForecast(
    ForecastsGetForecastEvent event,
    Emitter<ForecastsState> emit,
  ) async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    try {
      final params = GetForecastParams(
        latitude: event.latitude,
        longitude: event.longitude,
      );
      final result = await _getForecastUseCase.call(params: params);
      result.fold(
        (failure) => emit(state.copyWith(
          status: StateStatus.error,
          message: failure.message,
        )),
        (forecast) {
          final List<ForecastEntity> items = List<ForecastEntity>.from(state.forecasts);
          emit(state.copyWith(
            status: StateStatus.success,
            forecasts: items..add(forecast),
          ));
        },
      );
    } catch (e) {
      debugPrint('ForecastGetEvent error: $e');
      emit(state.copyWith(
        status: StateStatus.error,
        message: L10n.current.somethingWentWrong,
      ));
    }
  }
}
