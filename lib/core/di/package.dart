import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class PackageModule {
  @preResolve
  Future<Package> get appConfig async {
    return Package.fromEnvironment();
  }
}

class Package {
  final String version;
  final String build;
  final String lanugage;
  final SharedPreferences sharedPreferences;
  // final FirebaseApp firebaseApp;
  // final FirebaseAppCheck firebaseAppCheck;

  const Package({
    required this.build,
    required this.version,
    required this.lanugage,
    required this.sharedPreferences,
    // required this.firebaseApp,
    // required this.firebaseAppCheck,
  });

  static Future<Package> fromEnvironment() async {
    // final firebaseApp = await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    //
    // final firebaseAppCheck = FirebaseAppCheck.instance;

    // const debugToken = String.fromEnvironment('FirebaseAppCheck');

    // await firebaseAppCheck.activate(
    //   providerAndroid: debugToken.isEmpty
    //       ? const AndroidPlayIntegrityProvider()
    //       : const AndroidDebugProvider(debugToken: debugToken),
    // );

    // firebaseAppCheck.setTokenAutoRefreshEnabled(true);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final language = sharedPreferences.getString('app-language') ?? 'ru_KK';

    Intl.defaultLocale = language;
    await initializeDateFormatting(language, null);

    return Package(
      lanugage: language,
      version: packageInfo.version,
      build: packageInfo.buildNumber,
      sharedPreferences: sharedPreferences,
      // firebaseApp: firebaseApp,
      // firebaseAppCheck: firebaseAppCheck,
    );
  }

  Future<bool> setAccessToken(String token) async {
    return sharedPreferences.setString('auth-token', token);
  }

  String? getAccessToken() {
    return sharedPreferences.getString('auth-token');
  }

  Future<bool> removeAccessToken() async {
    return sharedPreferences.remove('auth-token');
  }

  String? getAppLanguage() {
    return sharedPreferences.getString('app-language');
  }

  Locale getAppLocale() {
    final language = getAppLanguage();
    if (language == 'ru_KZ') {
      return const Locale('ru');
    }
    if (language == 'en_KZ') {
      return const Locale('en');
    }
    if (language == 'kk_KZ') {
      return const Locale('kk');
    }
    return Locale('ru');
  }

  Future<bool> setAppVersion(String language) async {
    return sharedPreferences.setString('app-language', language);
  }
}
