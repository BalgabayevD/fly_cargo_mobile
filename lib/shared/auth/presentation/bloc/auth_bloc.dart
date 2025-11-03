import 'package:flutter_better_auth/flutter_better_auth.dart';
import 'package:flutter_better_auth/plugins/phone/models/verify/verify_phone_body.dart';
import 'package:flutter_better_auth/plugins/phone/phone_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUseCase _signInUseCase;
  final AuthStatusUseCase _authStatusUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;

  AuthBloc(
    this._signInUseCase,
    this._authStatusUseCase,
    this._getUserProfileUseCase,
  ) : super(const AuthInitial()) {
    on<AuthInitialized>(_onInitialized);
    on<AuthRequestOTPRequested>(_onRequestOTP);
    on<AuthVerifyCodeRequested>(_verifyCode);
    on<AuthLogout>(_onLogout);
  }

  Future<void> _onInitialized(
    AuthInitialized event,
    Emitter<AuthState> emit,
  ) async {
    // await FlutterBetterAuth.client.signOut();
    final session = await FlutterBetterAuth.client.getSession();
    if (session.data?.session != null) {
      try {
        // Загружаем профиль пользователя после авторизации
        final userProfile = await _getUserProfileUseCase();
        emit(
          AuthAuthenticated(
            userType: UserType.client,
            userId: session.data?.session.userId,
            accessToken: session.data?.session.token,
            userProfile: userProfile,
          ),
        );
      } catch (e) {
        // Если не удалось загрузить профиль, все равно считаем пользователя авторизованным
        emit(
          AuthAuthenticated(
            userType: UserType.client,
            userId: session.data?.session.userId,
            accessToken: session.data?.session.token,
          ),
        );
      }
    }
  }

  Future<void> _onRequestOTP(
    AuthRequestOTPRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final response = await _signInUseCase(event.phoneNumber);

      if (response != null) {
        emit(
          AuthCodeSent(
            deviceId: response.message,
            preAuthSessionId: response.message,
            phoneNumber: event.phoneNumber,
          ),
        );
      } else {
        emit(const AuthError(message: 'Ошибка отправки кода'));
      }
    } catch (e) {
      emit(AuthError(message: 'Не удалось отправить код: ${e.toString()}'));
    }
  }

  Future<void> _verifyCode(
    AuthVerifyCodeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final response = await FlutterBetterAuth.client.phone.verify(
        body: VerifyPhoneBody(phoneNumber: event.phoneNumber, code: event.code),
      );
      final sessionStatus = await _authStatusUseCase.getSessionStatus();
      final isAuthenticated = sessionStatus?.session != null;

      if (isAuthenticated) {
        final token = await _authStatusUseCase.getCurrentToken();

        try {
          // Загружаем профиль пользователя после успешной авторизации
          final userProfile = await _getUserProfileUseCase();
          emit(
            AuthAuthenticated(
              userType: UserType.client,
              userId: sessionStatus?.session.userId,
              accessToken: token,
              userProfile: userProfile,
            ),
          );
        } catch (e) {
          // Если не удалось загрузить профиль, все равно считаем пользователя авторизованным
          emit(
            AuthAuthenticated(
              userType: UserType.client,
              userId: sessionStatus?.session.userId,
              accessToken: token,
            ),
          );
        }
      } else {
        emit(const AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(message: 'Не удалось подтвердить код: ${e.toString()}'));
    }
  }

  Future<void> _onLogout(AuthLogout event, Emitter<AuthState> emit) async {
    await FlutterBetterAuth.client.signOut();
    emit(const AuthInitial());
  }
}
