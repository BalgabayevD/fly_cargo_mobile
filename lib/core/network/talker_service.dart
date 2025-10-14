import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

class TalkerService {
  static TalkerService? _instance;
  static TalkerService get instance => _instance ??= TalkerService._();

  TalkerService._();

  late final Talker _talker;

  void initialize() {
    _talker = TalkerFlutter.init(
      settings: TalkerSettings(
        useConsoleLogs: kDebugMode,
        useHistory: true,
        maxHistoryItems: 100,
      ),
    );
  }

  Talker get talker => _talker;

  // HTTP логирование (TalkerDioLogger автоматически обрабатывает HTTP запросы)
  void logHttpError({
    required String method,
    required String url,
    int? statusCode,
    String? message,
    dynamic error,
  }) {
    _talker.error('HTTP Error: $method $url - $message');
  }

  // Общие логи
  void logInfo(String message) {
    _talker.info(message);
  }

  void logWarning(String message) {
    _talker.warning(message);
  }

  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _talker.error(message, error, stackTrace);
  }

  void logDebug(String message) {
    _talker.debug(message);
  }

  void logSuccess(String message) {
    _talker.info('✅ $message');
  }
}
