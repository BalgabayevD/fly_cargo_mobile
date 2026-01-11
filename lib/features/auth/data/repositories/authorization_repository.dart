import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/auth/data/models/user_session_model.dart';
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthorizationRepository)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final Requestable requestable;
  final Configuration configuration;

  const AuthorizationRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<UserSessionInfoModel?> getSession() async {
    return requestable.dio.get('$_/authorization/get-session').then((response) {
      if (response.data == null) return null;

      final model = UserSessionInfoModel.fromJson(response.data);

      final accessToken = response.headers.value('set-auth-token');

      if (accessToken != null) {
        return model.copyWith(accessToken: accessToken);
      } else {
        return model;
      }
    });
  }

  @override
  Future<dynamic> requestOTP(String phoneNumber) async {
    return requestable.dio.post(
      '$_/authorization/phone-number/send-otp',
      data: {'phoneNumber': phoneNumber},
    );
  }

  @override
  Future<String?> confirmOTP(String phoneNumber, String code) async {
    return requestable.dio
        .post(
          '$_/authorization/phone-number/verify',
          data: {
            'phoneNumber': phoneNumber,
            'disableSession': false,
            'code': code,
          },
        )
        .then((response) {
          return response.headers.value('set-auth-token');
        });
  }

  @override
  Future<dynamic> signOut() async {
    return requestable.dio.post('$_/authorization/sign-out', data: {});
  }
}
