import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class LocationEntity extends Equatable {
  final String? country;
  final String? name;
  final double? latitude;
  final double? longitude;

  const LocationEntity({
    this.country,
    this.name,
    this.latitude,
    this.longitude,
  });

  String? get fullLocality => '$country, $name';

  LatLng? get latLng {
    if (latitude == null || longitude == null) return null;
    return LatLng(latitude!, longitude!);
  }

  LocationEntity copyWith({
    String? country,
    String? name,
    double? latitude,
    double? longitude,
  }) {
    return LocationEntity(
      country: country ?? this.country,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory LocationEntity.fromMap(Map<String, dynamic> map) {
    return LocationEntity(
      country: map['country'],
      name: map['name'],
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
    );
  }

  factory LocationEntity.fromPlacemark({
    required Placemark placemark,
    double? latitude,
    double? longitude,
  }) {
    return LocationEntity(
      country: placemark.country,
      name: placemark.locality ??
          placemark.subLocality ??
          placemark.administrativeArea ??
          DateTime.now().microsecond.toString(),
      latitude: latitude,
      longitude: longitude,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationEntity.fromJson(String source) =>
      LocationEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationEntity(country: $country, name: $name, latitude: $latitude, longitude: $longitude)';
  }

  @override
  List<Object?> get props => [country, name, latitude, longitude];
}
