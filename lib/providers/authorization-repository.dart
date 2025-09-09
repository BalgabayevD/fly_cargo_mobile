import 'package:fly_cargo/providers/network-repository.dart';
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

  void provideNetwork(NetworkRepository network) {
    network.dio.interceptors.add(
      SuperTokensInterceptorWrapper(client: network.dio),
    );
  }

  Future<(String, String)> signIn(NetworkRepository network) async {
    final res = await network.dio.post(
      "https://user-cargo.maguya.kz/api/auth/signinup/code",
      data: {"phoneNumber": "+77773806602"},
    );
    final deviceId = res.data['deviceId'] as String;
    final preAuthSessionId = res.data['preAuthSessionId'] as String;
    return (deviceId, preAuthSessionId);
  }

  Future<void> signCode(
    NetworkRepository network,
    String deviceId,
    String preAuthSessionId,
    String code,
  ) async {
    final res2 = await network.dio.post(
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
