part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.theme = ThemeMode.system,
    this.locale = const Locale('ru'),
  });

  final ThemeMode theme;
  final Locale locale;

  @override
  List<Object> get props => [
        theme,
        locale,
      ];
}
