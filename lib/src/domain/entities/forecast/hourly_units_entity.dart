import 'dart:convert';

import 'package:equatable/equatable.dart';

class HourlyUnitsEntity extends Equatable {
  final String? time;
  final String? temperature2m;
  final String? relativeHumidity2m;
  final String? precipitationProbability;
  final String? rain;
  final String? snowfall;
  final String? cloudcover;
  final String? visibility;

  const HourlyUnitsEntity({
    this.time,
    this.temperature2m,
    this.relativeHumidity2m,
    this.precipitationProbability,
    this.rain,
    this.snowfall,
    this.cloudcover,
    this.visibility,
  });

  @override
  List<Object?> get props {
    return [
      time,
      temperature2m,
      relativeHumidity2m,
      precipitationProbability,
      rain,
      snowfall,
      cloudcover,
      visibility,
    ];
  }

  HourlyUnitsEntity copyWith({
    String? time,
    String? temperature2m,
    String? relativeHumidity2m,
    String? precipitationProbability,
    String? rain,
    String? snowfall,
    String? cloudcover,
    String? visibility,
  }) {
    return HourlyUnitsEntity(
      time: time ?? this.time,
      temperature2m: temperature2m ?? this.temperature2m,
      relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
      precipitationProbability: precipitationProbability ?? this.precipitationProbability,
      rain: rain ?? this.rain,
      snowfall: snowfall ?? this.snowfall,
      cloudcover: cloudcover ?? this.cloudcover,
      visibility: visibility ?? this.visibility,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'temperature_2m': temperature2m,
      'relativeHumidity_2m': relativeHumidity2m,
      'precipitationProbability': precipitationProbability,
      'rain': rain,
      'snowfall': snowfall,
      'cloudcover': cloudcover,
      'visibility': visibility,
    };
  }

  factory HourlyUnitsEntity.fromMap(Map<String, dynamic> map) {
    return HourlyUnitsEntity(
      time: map['time'] as String?,
      temperature2m: map['temperature_2m'] as String?,
      relativeHumidity2m: map['relativeHumidity_2m'] as String?,
      precipitationProbability: map['precipitation_probability'] as String?,
      rain: map['rain'] as String?,
      snowfall: map['snowfall'] as String?,
      cloudcover: map['cloudcover'] as String?,
      visibility: map['visibility'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyUnitsEntity.fromJson(String source) =>
      HourlyUnitsEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HourlyUnitsEntity(time: $time, temperature2m: $temperature2m, relativeHumidity2m: $relativeHumidity2m, precipitationProbability: $precipitationProbability, rain: $rain, snowfall: $snowfall, cloudcover: $cloudcover, visibility: $visibility)';
  }
}

/*
 "hourly_units": {
    "time": "iso8601",
    "temperature_2m": "°C",
    "relativehumidity_2m": "%",
    "precipitation_probability": "%",
    "rain": "mm",
    "snowfall": "cm",
    "cloudcover": "%",
    "visibility": "m"
  },
*/