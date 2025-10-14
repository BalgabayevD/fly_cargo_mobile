import 'package:dio/dio.dart';
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';

@Named('auth-interceptor')
@LazySingleton(as: Interceptor)
class AuthInterceptor extends Interceptor {
  final GetSessionIdBehavior _accessTokenBehavior;

  AuthInterceptor(
    @Named('super-tokens-session-behavior') this._accessTokenBehavior,
  );

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _accessTokenBehavior.getSessionId();

    if (token?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
