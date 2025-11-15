import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/auth/data/models/auth_models.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_source.g.dart';

@RestApi()
abstract class AuthRemoteSource {
  factory AuthRemoteSource(Dio dio, {String baseUrl}) = _AuthRemoteSource;


  @POST('/api/auth/signinup/code')
  Future<SignInResponse> signIn(@Body() SignInRequest request);


  @POST('/api/auth/signinup/code/consume')
  Future<SignCodeResponse> signCode(@Body() SignCodeRequest request);


  @GET('/api/auth/session')
  Future<SessionStatusResponse> getSessionStatus();


  @POST('/api/auth/session/refresh')
  Future<SignCodeResponse> refreshToken();


  @POST('/api/auth/signout')
  Future<void> signOut();


  @GET('/api/v1/user/profile')
  Future<UserProfileResponse> getUserProfile();
}
