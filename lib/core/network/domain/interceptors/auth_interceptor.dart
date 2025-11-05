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
    await SharedPreferences.getInstance().then((store) {
      final auth_token = store.getString('auth-token');
      if (auth_token != null) {
        options.headers['Authorization'] = "Bearer $auth_token";
      }
      handler.next(options);
    });
  }
}
