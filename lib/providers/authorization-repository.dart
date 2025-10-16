import 'package:dio/dio.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:supertokens_flutter/dio.dart';
import 'package:supertokens_flutter/supertokens.dart';

class AuthorizationRepository {
  AuthorizationRepository() {
    final apiDomain = String.fromEnvironment(
      'AUTH_API_DOMAIN',
      defaultValue: 'https://user-cargo.maguya.kz/api/auth',
    );
    if (apiDomain.isEmpty) {
      throw Exception('AuthorizationRepository: нужно указать AUTH_API_DOMAIN');
    }
    SuperTokens.init(apiDomain: apiDomain);
    print('AuthorizationRepository success');
  }

  void provideNetwork() {
    final dio = getIt<Dio>(instanceName: 'private-dio');
    dio.interceptors.add(SuperTokensInterceptorWrapper(client: dio));
  }

  Future<(String, String)> signIn() async {
    final dio = getIt<Dio>(instanceName: 'private-dio');
    final res = await dio.post(
      "https://user-cargo.maguya.kz/api/auth/signinup/code",
      data: {"phoneNumber": "+77773806602"},
    );
    final deviceId = res.data['deviceId'] as String;
    final preAuthSessionId = res.data['preAuthSessionId'] as String;
    return (deviceId, preAuthSessionId);
  }

  Future<void> signCode(
    String deviceId,
    String preAuthSessionId,
    String code,
  ) async {
    final dio = getIt<Dio>(instanceName: 'private-dio');
    final res2 = await dio.post(
      "https://user-cargo.maguya.kz/api/auth/signinup/code/consume",
      data: {
        "deviceId": deviceId,
        "preAuthSessionId": preAuthSessionId,
        "userInputCode": code,
      },
    );
    print(res2);
  }

  Future<void> gig() async {
    final a = await SuperTokens.doesSessionExist();
    print(a);
  }
}
