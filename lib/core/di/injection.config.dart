// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:fly_cargo/core/config/core_module.dart' as _i624;
import 'package:fly_cargo/core/network/api_config.dart' as _i469;
import 'package:fly_cargo/core/network/dio_module.dart' as _i794;
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart'
    as _i856;
import 'package:fly_cargo/core/network/domain/behaviors/super_tokens_session_behavior.dart'
    as _i346;
import 'package:fly_cargo/core/network/domain/interceptors/auth_interceptor.dart'
    as _i411;
import 'package:fly_cargo/shared/auth/config/auth_module.dart' as _i522;
import 'package:fly_cargo/shared/auth/data/auth_remote_source.dart' as _i764;
import 'package:fly_cargo/shared/auth/data/repositories/auth_repository_impl.dart'
    as _i505;
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart'
    as _i214;
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart'
    as _i215;
import 'package:fly_cargo/shared/auth/domain/usecases/sign_code_usecase.dart'
    as _i166;
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart'
    as _i919;
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart'
    as _i138;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final dioModule = _$DioModule();
    final authModule = _$AuthModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i207.Talker>(() => coreModule.talker);
    gh.singleton<_i469.ApiConfig>(() => _i469.ApiConfig());
    gh.lazySingleton<_i856.GetSessionIdBehavior>(
      () => _i346.SuperTokensSessionBehavior(),
      instanceName: 'super-tokens-session-behavior',
    );
    gh.lazySingleton<_i361.Interceptor>(
      () => coreModule.logInterceptor(gh<_i207.Talker>()),
      instanceName: 'log-interceptor',
    );
    gh.lazySingleton<_i361.Interceptor>(
      () => _i411.AuthInterceptor(
        gh<_i856.GetSessionIdBehavior>(
          instanceName: 'super-tokens-session-behavior',
        ),
      ),
      instanceName: 'auth-interceptor',
    );
    gh.factory<_i361.Dio>(
      () => dioModule.getPublicDio(
        gh<_i361.Interceptor>(instanceName: 'log-interceptor'),
      ),
      instanceName: 'public-dio',
    );
    gh.factory<_i764.AuthRemoteSource>(
      () => authModule.provideAuthRemoteSource(
        gh<_i361.Dio>(instanceName: 'public-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i361.Dio>(
      () => dioModule.getPrivateDio(
        gh<_i361.Interceptor>(instanceName: 'log-interceptor'),
        gh<_i361.Interceptor>(instanceName: 'auth-interceptor'),
      ),
      instanceName: 'private-dio',
    );
    gh.lazySingleton<_i214.AuthRepository>(
      () => _i505.AuthRepositoryImpl(
        gh<_i764.AuthRemoteSource>(),
        gh<_i856.GetSessionIdBehavior>(
          instanceName: 'super-tokens-session-behavior',
        ),
      ),
    );
    gh.factory<_i166.SignCodeUseCase>(
      () => _i166.SignCodeUseCase(gh<_i214.AuthRepository>()),
    );
    gh.factory<_i919.SignInUseCase>(
      () => _i919.SignInUseCase(gh<_i214.AuthRepository>()),
    );
    gh.factory<_i215.AuthStatusUseCase>(
      () => _i215.AuthStatusUseCase(gh<_i214.AuthRepository>()),
    );
    gh.factory<_i138.AuthBloc>(
      () => _i138.AuthBloc(
        gh<_i919.SignInUseCase>(),
        gh<_i166.SignCodeUseCase>(),
        gh<_i215.AuthStatusUseCase>(),
      ),
    );
    return this;
  }
}

class _$CoreModule extends _i624.CoreModule {}

class _$DioModule extends _i794.DioModule {}

class _$AuthModule extends _i522.AuthModule {}
