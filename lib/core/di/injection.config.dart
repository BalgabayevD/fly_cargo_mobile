// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:fly_cargo/core/di/app.dart' as _i478;
import 'package:fly_cargo/core/di/configuration.dart' as _i156;
import 'package:fly_cargo/core/di/environment_variables.dart' as _i941;
import 'package:fly_cargo/core/di/package.dart' as _i51;
import 'package:fly_cargo/core/di/requestable.dart' as _i129;
import 'package:fly_cargo/core/l10n/locale_cubit.dart' as _i596;
import 'package:fly_cargo/features/auth/data/repositories/authorization_repository.dart'
    as _i652;
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart'
    as _i498;
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart'
    as _i550;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final environmentVariablesModule = _$EnvironmentVariablesModule();
    final packageModule = _$PackageModule();
    final requestableModule = _$RequestableModule();
    await gh.factoryAsync<_i941.EnvironmentVariables>(
      () => environmentVariablesModule.environmentVariables(),
      preResolve: true,
    );
    await gh.factoryAsync<_i51.Package>(
      () => packageModule.appConfig,
      preResolve: true,
    );
    gh.singleton<_i596.LocaleCubit>(
      () => _i596.LocaleCubit(gh<_i51.Package>()),
    );
    gh.factory<_i156.Configuration>(
      () => _i156.Configuration(
        package: gh<_i51.Package>(),
        environmentVariables: gh<_i941.EnvironmentVariables>(),
      ),
    );
    await gh.factoryAsync<_i129.Requestable>(
      () => requestableModule.requestable(gh<_i156.Configuration>()),
      preResolve: true,
    );
    gh.factory<_i478.App>(
      () => _i478.App(
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    gh.factory<_i498.AuthorizationRepository>(
      () => _i652.AuthorizationRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i550.AuthorizationBloc>(
      () => _i550.AuthorizationBloc(
        authorizationRepository: gh<_i498.AuthorizationRepository>(),
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    return this;
  }
}

class _$EnvironmentVariablesModule extends _i941.EnvironmentVariablesModule {}

class _$PackageModule extends _i51.PackageModule {}

class _$RequestableModule extends _i129.RequestableModule {}
