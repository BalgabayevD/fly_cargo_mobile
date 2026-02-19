import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserSessionInfoModel?> getSession();
  Future<void> requestOTP(String phoneNumber);
  Future<String?> confirmOTP(String phoneNumber, String code);
  Future<bool> updateProfile(String name);
  Future<void> signOut();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Requestable _requestable;
  final Configuration _configuration;

  const AuthRemoteDataSourceImpl(
    this._requestable,
    this._configuration,
  );

  String get _baseUrl => _configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<UserSessionInfoModel?> getSession() async {
    try {
      final response = await _requestable.dio.get(
        '$_baseUrl/authorization/get-session',
      );

      if (response.data == null) {
        return null;
      }

      return UserSessionInfoModel.fromJson(response.data);
    } catch (_, _) {
      rethrow;
    }
  }

  @override
  Future<void> requestOTP(String phoneNumber) async {
    try {
      await _requestable.dio.post(
        '$_baseUrl/authorization/phone-number/send-otp',
        data: {'phoneNumber': phoneNumber},
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String?> confirmOTP(String phoneNumber, String code) async {
    try {
      final response = await _requestable.dio.post(
        '$_baseUrl/authorization/phone-number/verify',
        data: {
          'phoneNumber': phoneNumber,
          'disableSession': false,
          'code': code,
        },
      );

      return response.headers.value('set-auth-token');
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> updateProfile(String name) async {
    try {
      final response = await _requestable.dio.post<bool>(
        '$_baseUrl/user/profile/edit/username',
        data: {'name': name},
      );

      return response.data ?? false;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _requestable.dio.post('$_baseUrl/authorization/sign-out', data: {});
    } catch (_) {
      rethrow;
    }
  }
}
