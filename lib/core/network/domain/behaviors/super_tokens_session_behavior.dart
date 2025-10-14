import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';
import 'package:supertokens_flutter/supertokens.dart';

@Named('super-tokens-session-behavior')
@LazySingleton(as: GetSessionIdBehavior)
class SuperTokensSessionBehavior implements GetSessionIdBehavior {
  @override
  Future<String?> getSessionId() async {
    try {
      final sessionExists = await SuperTokens.doesSessionExist();

      if (sessionExists) {
        return await SuperTokens.getAccessToken();
      }

      return null;
    } catch (e) {
      // Если произошла ошибка при получении токена, возвращаем null
      return null;
    }
  }
}
