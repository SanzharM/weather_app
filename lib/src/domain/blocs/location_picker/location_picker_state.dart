part of 'location_picker_bloc.dart';

abstract class LocationPickerState extends Equatable {
  const LocationPickerState();

  @override
  List<Object> get props => [];
}

class LocationPickerInitial extends LocationPickerState {}

class LocationPickerLoading extends LocationPickerState {}

class LocationPickerError extends LocationPickerState {
  final String message;

  const LocationPickerError(this.message);

  @override
  List<Object> get props => [message];
}

class LocationPickerLoaded extends LocationPickerState {
  final LocationEntity location;

  const LocationPickerLoaded(this.location);

  @override
  List<Object> get props => [location];
}
