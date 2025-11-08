import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_source.g.dart';

@RestApi()
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String baseUrl}) = _AuthRemoteSource;

  /// Отправка номера телефона для получения кода подтверждения
  @POST('/api/auth/signinup/code')
  Future<SignInResponse> signIn(@Body() SignInRequest request);

  /// Подтверждение кода и получение токенов
  @POST('/api/auth/signinup/code/consume')
  Future<SignCodeResponse> signCode(@Body() SignCodeRequest request);

  /// Проверка статуса сессии
  @GET('/api/auth/session')
  Future<SessionStatusResponse> getSessionStatus();

  /// Обновление токена
  @POST('/api/auth/session/refresh')
  Future<SignCodeResponse> refreshToken();

  /// Выход из системы
  @POST('/api/auth/signout')
  Future<void> signOut();

  /// Получение профиля пользователя
  @GET('/api/v1/user/profile')
  Future<UserProfileResponse> getUserProfile();
}
