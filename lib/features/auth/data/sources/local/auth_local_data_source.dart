import 'dart:convert';

import 'package:fly_cargo/core/di/package.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthLocalDataSource {
  Future<UserSessionInfoModel?> getCachedSession();
  Future<void> cacheSession(UserSessionInfoModel session);
  Future<void> clearSession();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const _sessionKey = 'user_session';

  final Package package;

  const AuthLocalDataSourceImpl(this.package);

  @override
  Future<UserSessionInfoModel?> getCachedSession() async {
    try {
      final sessionJson = package.sharedPreferences.getString(_sessionKey);
      if (sessionJson == null) return null;

      final Map<String, dynamic> jsonMap = json.decode(sessionJson);
      return UserSessionInfoModel.fromJson(jsonMap);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> cacheSession(UserSessionInfoModel session) async {
    try {
      final sessionJson = json.encode(session.toJson());
      await package.sharedPreferences.setString(_sessionKey, sessionJson);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await package.sharedPreferences.remove(_sessionKey);
    } catch (_) {
      rethrow;
    }
  }
}
