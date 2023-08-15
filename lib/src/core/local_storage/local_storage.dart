import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/src/core/l10n/l10n_service.dart';
import 'package:weather_app/src/domain/entities/location/location_entity.dart';

class LocalStorage {
  const LocalStorage();

  final _storage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  static const String _locationsKey = 'WeatherAppLocationsKey';
  static const String _themeModeKey = 'WeatherAppThemeModeKey';
  static const String _localeKey = 'WeatherAppLocaleKey';

  // LOCATIONS
  Future<void> setLocation(LocationEntity location) async {
    final List<LocationEntity> storedLocations = await getLocations();
    return await _storage.write(
      key: _locationsKey,
      value: jsonEncode(storedLocations..add(location)),
    );
  }

  Future<List<LocationEntity>> getLocations() async {
    final String? rawJson = await _storage.read(key: _locationsKey);
    if (rawJson?.isEmpty ?? true) {
      return [];
    }
    return (rawJson as List).map((e) => LocationEntity.fromJson(e)).toList();
  }

  // THEME MODE
  Future<void> setThemeMode(ThemeMode themeMode) async {
    return await _storage.write(
      key: _themeModeKey,
      value: themeMode.name,
    );
  }

  Future<ThemeMode> getThemeMode() async {
    final String? value = await _storage.read(key: _themeModeKey);
    if (value == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (value == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  // LOCALE
  Future<void> setLocale(Locale locale) async {
    return await _storage.write(
      key: _localeKey,
      value: locale.languageCode,
    );
  }

  Future<Locale> getLocale() async {
    final String? value = await _storage.read(key: _localeKey);
    Locale matchingLocale = L10n.supportedLocales.first;
    if (L10n.supportedLocales.any((locale) => locale.languageCode == value)) {
      matchingLocale = L10n.supportedLocales.firstWhere(
        (locale) => locale.languageCode == value,
      );
    }
    return matchingLocale;
  }
}
