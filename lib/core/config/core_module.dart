
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class CoreModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named('log-interceptor')
  @lazySingleton
  Interceptor logInterceptor(Talker talker) {
    return TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
        printResponseData: true,
        printResponseHeaders: true,
        printResponseMessage: true,
        requestPen: AnsiPen()..xterm(10),
        responsePen: AnsiPen()..xterm(10),
        errorPen: AnsiPen()..xterm(10),
      ),
    );
  }

  @singleton
  Talker get talker {
    final talker = Talker(
      settings: TalkerSettings(
        enabled: true,
        useConsoleLogs: true,
        useHistory: true,
        maxHistoryItems: 1000,
      ),
      logger: TalkerLogger(
        settings: TalkerLoggerSettings(enableColors: false, maxLineWidth: 200),
      ),
    );

    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printEventFullData: true,
        printStateFullData: true,
        printTransitions: true,
        printChanges: true,
      ),
    );

    return talker;
  }
}
