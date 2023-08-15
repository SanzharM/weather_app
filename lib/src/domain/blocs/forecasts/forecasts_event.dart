part of 'forecasts_bloc.dart';

abstract class ForecastsEvent extends Equatable {
  const ForecastsEvent();

  @override
  List<Object> get props => [];
}

class ForecastsGetLocationsEvent extends ForecastsEvent {}

class ForecastsGetForecastEvent extends ForecastsEvent {
  final double latitude;
  final double longitude;
  final int? forecastDays;
  final int? pastDays;

  const ForecastsGetForecastEvent({
    required this.latitude,
    required this.longitude,
    this.forecastDays,
    this.pastDays,
  });
}
