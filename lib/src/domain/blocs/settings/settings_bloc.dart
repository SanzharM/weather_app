import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
    emit(const SettingsState());
  }
}
