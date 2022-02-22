import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:books_app/utils/app_palette.dart';
import 'package:books_app/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_event.dart';

part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(ThemeState(AppTheme.lightBlueTheme)) {
    on<InitAppSettings>(_handleSettingsInitialization);
    on<ToogleTheme>(_handleThemeChange);
    on<ChangeLocale>(_handleChangeLocale);
  }

  Future<FutureOr<void>> _handleSettingsInitialization(
      InitAppSettings event, Emitter<AppSettingsState> emit) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    String? _appThemeString = _storage.getString("APP_THEME");
    if (_appThemeString != null) {
      AppTheme? _theme;
      AppConstants.themeStrings.forEach((key, value) {
        if (value == _appThemeString) {
          _theme = key;
        }
      });

      if (_theme != null) {
        emit(ThemeState(_theme!));
      }
    }
  }

  Future<FutureOr<void>> _handleThemeChange(
      ToogleTheme event, Emitter<AppSettingsState> emit) async {
    AppTheme? _theme = event.appTheme;
    try {
      SharedPreferences _storage = await SharedPreferences.getInstance();

      if (_theme != null) {
        _storage.setString("APP_THEME", AppConstants.themeStrings[_theme]!);
        emit(ThemeState(_theme));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<FutureOr<void>> _handleChangeLocale(
      ChangeLocale event, Emitter<AppSettingsState> emit) async {
    Locale? locale = event.locale;
    SharedPreferences _storage = await SharedPreferences.getInstance();

    if (locale != null) {
      _storage.setString("APP_LOCALE", locale.languageCode);
      emit(LocaleState(locale));
    }
  }
}
