import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/jwt/jwt_extension.dart';
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';

@Named('flutter-better-auth-session-behavior')
@LazySingleton(as: GetSessionIdBehavior)
class FlutterBetterAuthSessionBehavior implements GetSessionIdBehavior {
  @override
  Future<String?> getSessionId() async {
    try {

      final session = await FlutterBetterAuth.client.getSession();
      if (session.data?.session == null) {
        return null;
      }


      final tokenResult = await FlutterBetterAuth.client.jwt.token();
      return tokenResult.data?.token;
    } catch (e) {

      return null;
    }
  }
}
