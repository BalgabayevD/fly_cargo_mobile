import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocaleCubit extends Cubit<Locale> {
  static const String _localeKey = 'app_locale';
  final SharedPreferences _prefs;

  LocaleCubit(this._prefs) : super(_getInitialLocale(_prefs));

  static Locale _getInitialLocale(SharedPreferences prefs) {
    final savedLocale = prefs.getString(_localeKey);
    if (savedLocale != null) {
      return Locale(savedLocale);
    }
    // По умолчанию русский язык
    return const Locale('ru');
  }

  Future<void> changeLocale(Locale locale) async {
    await _prefs.setString(_localeKey, locale.languageCode);
    emit(locale);
  }
}
