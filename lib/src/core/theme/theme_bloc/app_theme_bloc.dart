import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pa_sreens/src/core/theme/theme_data/theme_data.dart';
part 'app_theme_event.dart';
part 'app_theme_state.dart';
part 'app_theme_bloc.freezed.dart';

class AppThemeBloc extends HydratedBloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc()
      : super(AppThemeState.initial(
            currentTheme: kAppThemeData[AppThemeEnum.Dark]!)) {
    on<_ToggleTheme>(_toggleTheme);
  }

  Future<void> _toggleTheme(
      AppThemeEvent event, Emitter<AppThemeState> emit) async {
    if (event is _ToggleTheme) {
      if (state.currentTheme == kAppThemeData[AppThemeEnum.Dark]!) {
        emit(AppThemeState.initial(
            // currentTheme: kAppThemeData[AppThemeEnum.Dark]!));
            currentTheme: kAppThemeData[AppThemeEnum.Light]!));
      } else {
        emit(
            AppThemeState.initial(currentTheme: kAppThemeData[AppThemeEnum.Dark]!));
      }
    }
  }

  @override
  AppThemeState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) {
        return AppThemeState.initial(
            currentTheme: kAppThemeData[AppThemeEnum.Light]!);
      }
      return AppThemeState.initial(currentTheme: kAppThemeData[AppThemeEnum.Dark]!);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppThemeState state) {
    try {
      return {
        'light': state.currentTheme == kAppThemeData[AppThemeEnum.Light]!,
      };
    } catch (e) {
      return null;
    }
  }
}
