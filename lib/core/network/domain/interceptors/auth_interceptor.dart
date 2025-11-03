import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';

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
    final token = await _accessTokenBehavior.getSessionId();

    if (token != null && token.isNotEmpty) {
      options.headers['Cookie'] = token;
    }
    handler.next(options);
  }
}
