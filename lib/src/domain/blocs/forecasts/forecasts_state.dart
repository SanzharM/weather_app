part of 'forecasts_bloc.dart';

class ForecastsState extends Equatable {
  const ForecastsState({
    this.locations = const [],
    this.forecasts = const [],
    this.status = StateStatus.initial,
    this.message = '',
  });

  final List<LocationEntity> locations;
  final List<ForecastEntity> forecasts;
  final StateStatus status;
  final String message;

  @override
  List<Object> get props => [locations, forecasts, status, message];

  ForecastsState copyWith({
    List<LocationEntity>? locations,
    List<ForecastEntity>? forecasts,
    StateStatus? status,
    String? message,
  }) {
    return ForecastsState(
      locations: locations ?? this.locations,
      forecasts: forecasts ?? this.forecasts,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
