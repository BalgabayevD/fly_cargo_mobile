import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/di/firebase_options.dart';
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
  final FirebaseApp firebaseApp;
  final FirebaseAppCheck firebaseAppCheck;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver analyticsObserver;

  const Package({
    required this.build,
    required this.version,
    required this.lanugage,
    required this.sharedPreferences,
    required this.firebaseApp,
    required this.firebaseAppCheck,
    required this.analytics,
    required this.analyticsObserver,
  });

  static Future<Package> fromEnvironment() async {
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final firebaseAppCheck = FirebaseAppCheck.instance;

    const debugToken = String.fromEnvironment('FirebaseAppCheck');

    if (debugToken.isEmpty) {
      await firebaseAppCheck.activate(
        providerAndroid: const AndroidPlayIntegrityProvider(),
        providerApple: const AppleDeviceCheckProvider(),
      );
    } else {
      await firebaseAppCheck.activate(
        providerAndroid: const AndroidDebugProvider(debugToken: debugToken),
        providerApple: const AppleDebugProvider(debugToken: debugToken),
      );
    }

    await firebaseAppCheck.setTokenAutoRefreshEnabled(true);

    final analytics = FirebaseAnalytics.instance;
    final analyticsObserver = FirebaseAnalyticsObserver(analytics: analytics);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    final language = sharedPreferences.getString('app-language') ?? 'ru_KK';

    Intl.defaultLocale = language;
    await initializeDateFormatting(language, null);

    return Package(
      lanugage: language,
      version: packageInfo.version,
      build: packageInfo.buildNumber,
      sharedPreferences: sharedPreferences,
      firebaseApp: firebaseApp,
      firebaseAppCheck: firebaseAppCheck,
      analytics: analytics,
      analyticsObserver: analyticsObserver,
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
