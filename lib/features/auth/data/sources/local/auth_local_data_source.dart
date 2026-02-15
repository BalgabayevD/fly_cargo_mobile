import 'dart:convert';

import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<UserSessionInfoModel?> getCachedSession();
  Future<void> cacheSession(UserSessionInfoModel session);
  Future<void> clearSession();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const _sessionKey = 'user_session';

  final SharedPreferences _prefs;

  const AuthLocalDataSourceImpl(this._prefs);

  @override
  Future<UserSessionInfoModel?> getCachedSession() async {
    try {
      final sessionJson = _prefs.getString(_sessionKey);
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
      await _prefs.setString(_sessionKey, sessionJson);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await _prefs.remove(_sessionKey);
    } catch (_) {
      rethrow;
    }
  }
}
