import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/package.dart';
import 'package:injectable/injectable.dart';

@singleton
class LocaleCubit extends Cubit<Locale> {
  final Package package;

  LocaleCubit(this.package) : super(package.getAppLocale());

  Future<void> changeLocale(Locale locale) async {
    // await package.sharedPreferences.setString(
    //   _localeKey,
    //   locale.languageCode,
    // );
    emit(locale);
  }
}
