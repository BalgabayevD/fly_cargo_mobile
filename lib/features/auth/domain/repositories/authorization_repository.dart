import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';

abstract interface class AuthorizationRepository {
  Future<dynamic> requestOTP(String phoneNumber);
  Future<String?> confirmOTP(String phoneNumber, String code);
  Future<UserSessionInfoModel?> getSession();
  Future<bool> updateProfile(String name);
  Future<dynamic> signOut();
}
