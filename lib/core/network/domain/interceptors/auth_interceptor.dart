import 'package:dio/dio.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_extension.dart';
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
    final token = await FlutterBetterAuth.client.jwt.token();

    if (token.data?.token.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
