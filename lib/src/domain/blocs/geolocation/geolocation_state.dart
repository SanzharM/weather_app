part of 'geolocation_bloc.dart';

class GeolocationState extends Equatable {
  const GeolocationState({
    this.currentLocation,
    this.permission,
    this.status = StateStatus.initial,
    this.message = '',
  });

  final LatLng? currentLocation;
  final LocationPermission? permission;
  final StateStatus status;
  final String message;

  @override
  List<Object?> get props => [currentLocation, permission, status, message];

  GeolocationState copyWith({
    LatLng? currentLocation,
    LocationPermission? permission,
    StateStatus? status,
    String? message,
  }) {
    return GeolocationState(
      currentLocation: currentLocation ?? this.currentLocation,
      permission: permission ?? this.permission,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
