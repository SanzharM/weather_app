part of 'location_picker_bloc.dart';

abstract class LocationPickerEvent extends Equatable {
  const LocationPickerEvent();

  @override
  List<Object?> get props => [];
}

class LocationPickerPickEvent extends LocationPickerEvent {
  final LatLng location;
  final String? localeIdentifier;

  const LocationPickerPickEvent(this.location, {this.localeIdentifier});

  @override
  List<Object?> get props => [location, localeIdentifier];
}
