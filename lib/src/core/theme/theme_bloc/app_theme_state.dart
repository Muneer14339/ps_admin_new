part of 'app_theme_bloc.dart';

@freezed
class AppThemeState with _$AppThemeState {
  const factory AppThemeState.initial({
     ThemeData? currentTheme,

  }) = _Initial;
}
