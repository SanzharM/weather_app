import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/core/local_storage/local_storage.dart';
import 'package:weather_app/src/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  void initial() => add(SettingsInitialEvent());

  SettingsBloc() : super(const SettingsState()) {
    on<SettingsInitialEvent>(_initial);
  }

  void _initial(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final ThemeMode themeMode = await sl<LocalStorage>().getThemeMode();
    final Locale locale = await sl<LocalStorage>().getLocale();

    return emit(SettingsState(theme: themeMode, locale: locale));
  }
}
