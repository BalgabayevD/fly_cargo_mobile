import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart';
import 'package:injectable/injectable.dart';

@Named('flutter-better-auth-session-behavior')
@LazySingleton(as: GetSessionIdBehavior)
class FlutterBetterAuthSessionBehavior implements GetSessionIdBehavior {
  @override
  Future<String?> getSessionId() async {
    try {
      final session = await FlutterBetterAuth.client.getSession();
      return session.data?.session.token;
    } catch (_) {
      return null;
    }
  }
}
