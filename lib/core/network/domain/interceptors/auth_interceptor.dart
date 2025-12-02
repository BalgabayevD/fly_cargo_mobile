import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Named('auth-interceptor')
@LazySingleton(as: Interceptor)
class AuthInterceptor extends Interceptor {
  final GetSessionIdBehavior _accessTokenBehavior;

  AuthInterceptor(
    @Named('flutter-better-auth-session-behavior') this._accessTokenBehavior,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // Пытаемся получить актуальный access token из FlutterBetterAuth
      final token = await _accessTokenBehavior.getSessionId();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      } else {
        // Fallback на локально сохранённый токен, если по какой‑то причине
        // FlutterBetterAuth не вернул действующую сессию.
        final store = await SharedPreferences.getInstance();
        final storedToken = store.getString('auth-token');
        if (storedToken != null && storedToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $storedToken';
        }
      }
    } finally {
      handler.next(options);
    }
  }
}
