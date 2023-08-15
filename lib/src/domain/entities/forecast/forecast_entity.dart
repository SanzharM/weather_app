import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:weather_app/src/domain/entities/forecast/hourly_units_entity.dart';
import 'package:weather_app/src/domain/entities/forecast/hourly_values_entity.dart';

class ForecastEntity extends Equatable {
  final double? latitude;
  final double? longitude;
  final double? generationTimeMs; // In Milliseconds
  final double? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final HourlyUnitsEntity? hourlyUnits;
  final HourlyValuesEntity? hourlyValues;

  const ForecastEntity({
    this.latitude,
    this.longitude,
    this.generationTimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourlyValues,
  });

  ForecastEntity copyWith({
    double? latitude,
    double? longitude,
    double? generationTimeMs,
    double? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    double? elevation,
    HourlyUnitsEntity? hourlyUnits,
    HourlyValuesEntity? hourlyValues,
  }) {
    return ForecastEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationTimeMs: generationTimeMs ?? this.generationTimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      hourlyUnits: hourlyUnits ?? this.hourlyUnits,
      hourlyValues: hourlyValues ?? this.hourlyValues,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'generationtime_ms': generationTimeMs,
      'utc_offset_seconds': utcOffsetSeconds,
      'timezone': timezone,
      'timezone_abbreviation': timezoneAbbreviation,
      'elevation': elevation,
      'hourly_units': hourlyUnits?.toMap(),
      'hourly': hourlyValues?.toMap(),
    };
  }

  factory ForecastEntity.fromMap(Map<String, dynamic> map) {
    return ForecastEntity(
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      generationTimeMs: map['generationtime_ms']?.toDouble(),
      utcOffsetSeconds: map['utc_offset_seconds']?.toDouble(),
      timezone: map['timezone'],
      timezoneAbbreviation: map['timezone_abbreviation'],
      elevation: map['elevation']?.toDouble(),
      hourlyUnits: map['hourly_units'] != null && map['hourly_units'] is Map
          ? HourlyUnitsEntity.fromMap(map['hourly_units'])
          : null,
      hourlyValues: map['hourly'] != null && map['hourly'] is Map
          ? HourlyValuesEntity.fromMap(map['hourly'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastEntity.fromJson(String source) =>
      ForecastEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ForecastEntity(latitude: $latitude, longitude: $longitude, generationTimeMs: $generationTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbreviation: $timezoneAbbreviation, elevation: $elevation, hourlyUnits: $hourlyUnits, hourlyValues: $hourlyValues)';
  }

  @override
  List<Object?> get props {
    return [
      latitude,
      longitude,
      generationTimeMs,
      utcOffsetSeconds,
      timezone,
      timezoneAbbreviation,
      elevation,
      hourlyUnits,
      hourlyValues,
    ];
  }
}
