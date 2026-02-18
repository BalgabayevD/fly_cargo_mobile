import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';

abstract interface class AuthorizationRepository {
  Future<UserSessionInfoEntity?> getCachedSession();
  Future<UserSessionInfoEntity?> getRemoteSession();
  Future<void> saveSession(UserSessionInfoEntity session);
  Future<void> clearSession();
  Future<void> requestOTP(String phoneNumber);
  Future<String?> confirmOTP(String phoneNumber, String code);
  Future<bool> updateProfile(String name);
  Future<void> signOut();
}
