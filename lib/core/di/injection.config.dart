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
import 'package:fly_cargo/core/network/domain/behaviors/flutter_better_auth_session_behavior.dart'
    as _i5;
import 'package:fly_cargo/core/network/domain/behaviors/get_sid_behavior.dart'
    as _i856;
import 'package:fly_cargo/core/network/domain/interceptors/auth_interceptor.dart'
    as _i411;
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart'
    as _i1019;
import 'package:fly_cargo/shared/auth/config/auth_module.dart' as _i522;
import 'package:fly_cargo/shared/auth/data/auth_remote_source.dart' as _i764;
import 'package:fly_cargo/shared/auth/data/repositories/auth_repository_impl.dart'
    as _i505;
import 'package:fly_cargo/shared/auth/domain/repositories/auth_repository.dart'
    as _i214;
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart'
    as _i215;
import 'package:fly_cargo/shared/auth/domain/usecases/get_user_profile_usecase.dart'
    as _i439;
import 'package:fly_cargo/shared/auth/domain/usecases/sign_code_usecase.dart'
    as _i166;
import 'package:fly_cargo/shared/auth/domain/usecases/sign_in_usecase.dart'
    as _i919;
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart'
    as _i138;
import 'package:fly_cargo/shared/destination/config/destination_module.dart'
    as _i993;
import 'package:fly_cargo/shared/destination/data/destination_remote_source.dart'
    as _i472;
import 'package:fly_cargo/shared/destination/data/repositories/destination_repository_impl.dart'
    as _i67;
import 'package:fly_cargo/shared/destination/domain/repositories/destination_repository.dart'
    as _i405;
import 'package:fly_cargo/shared/destination/domain/usecases/get_all_cities_usecase.dart'
    as _i583;
import 'package:fly_cargo/shared/destination/domain/usecases/get_cities_from_usecase.dart'
    as _i281;
import 'package:fly_cargo/shared/destination/domain/usecases/get_cities_to_usecase.dart'
    as _i292;
import 'package:fly_cargo/shared/destination/domain/usecases/search_addresses_usecase.dart'
    as _i576;
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_bloc.dart'
    as _i436;
import 'package:fly_cargo/shared/orders/config/orders_module.dart' as _i561;
import 'package:fly_cargo/shared/orders/data/orders_remote_source.dart'
    as _i642;
import 'package:fly_cargo/shared/orders/data/repositories/orders_repository_impl.dart'
    as _i157;
import 'package:fly_cargo/shared/orders/domain/repositories/orders_repository.dart'
    as _i919;
import 'package:fly_cargo/shared/orders/domain/usecases/calculate_order_price_usecase.dart'
    as _i426;
import 'package:fly_cargo/shared/orders/domain/usecases/create_order_usecase.dart'
    as _i49;
import 'package:fly_cargo/shared/orders/domain/usecases/get_client_orders_usecase.dart'
    as _i33;
import 'package:fly_cargo/shared/orders/domain/usecases/get_courier_orsers_usecase.dart'
    as _i189;
import 'package:fly_cargo/shared/orders/domain/usecases/get_created_orders_usecase.dart'
    as _i1011;
import 'package:fly_cargo/shared/orders/domain/usecases/get_order_by_id_usecase.dart'
    as _i177;
import 'package:fly_cargo/shared/orders/domain/usecases/upload_order_photo_usecase.dart'
    as _i910;
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart'
    as _i837;
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart'
    as _i635;
import 'package:fly_cargo/shared/tariffs/config/tariffs_module.dart' as _i584;
import 'package:fly_cargo/shared/tariffs/data/repositories/tariffs_repository_impl.dart'
    as _i711;
import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source.dart'
    as _i1059;
import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source_impl.dart'
    as _i618;
import 'package:fly_cargo/shared/tariffs/domain/repositories/tariffs_repository.dart'
    as _i528;
import 'package:fly_cargo/shared/tariffs/domain/usecases/create_tariff_usecase.dart'
    as _i369;
import 'package:fly_cargo/shared/tariffs/domain/usecases/get_tariff_categories_usecase.dart'
    as _i133;
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart'
    as _i545;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker/talker.dart' as _i993;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final dioModule = _$DioModule();
    final tariffsModule = _$TariffsModule();
    final authModule = _$AuthModule();
    final destinationModule = _$DestinationModule();
    final ordersModule = _$OrdersModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => coreModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i993.Talker>(() => coreModule.talker);
    gh.singleton<_i469.ApiConfig>(() => _i469.ApiConfig());
    gh.lazySingleton<_i856.GetSessionIdBehavior>(
      () => _i5.FlutterBetterAuthSessionBehavior(),
      instanceName: 'flutter-better-auth-session-behavior',
    );
    gh.lazySingleton<_i361.Interceptor>(
      () => _i411.AuthInterceptor(
        gh<_i856.GetSessionIdBehavior>(
          instanceName: 'flutter-better-auth-session-behavior',
        ),
      ),
      instanceName: 'auth-interceptor',
    );
    gh.lazySingleton<_i361.Interceptor>(
      () => coreModule.logInterceptor(gh<_i993.Talker>()),
      instanceName: 'log-interceptor',
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.getPrivateDio(
        gh<_i361.Interceptor>(instanceName: 'log-interceptor'),
        gh<_i361.Interceptor>(instanceName: 'auth-interceptor'),
      ),
      instanceName: 'private-dio',
    );
    gh.factory<_i1059.TariffsRemoteSource>(
      () => tariffsModule.provideTariffsRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i764.AuthRemoteSource>(
      () => authModule.provideAuthRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i472.DestinationRemoteSource>(
      () => destinationModule.provideDestinationRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i642.OrdersRemoteSource>(
      () => ordersModule.provideOrdersRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.lazySingleton<_i405.DestinationRepository>(
      () => _i67.DestinationRepositoryImpl(gh<_i472.DestinationRemoteSource>()),
    );
    gh.factory<_i292.GetCitiesToUseCase>(
      () => _i292.GetCitiesToUseCase(gh<_i405.DestinationRepository>()),
    );
    gh.factory<_i576.SearchAddressesUseCase>(
      () => _i576.SearchAddressesUseCase(gh<_i405.DestinationRepository>()),
    );
    gh.factory<_i583.GetAllCitiesUseCase>(
      () => _i583.GetAllCitiesUseCase(gh<_i405.DestinationRepository>()),
    );
    gh.factory<_i281.GetCitiesFromUseCase>(
      () => _i281.GetCitiesFromUseCase(gh<_i405.DestinationRepository>()),
    );
    gh.factory<_i436.DestinationBloc>(
      () => _i436.DestinationBloc(
        gh<_i281.GetCitiesFromUseCase>(),
        gh<_i292.GetCitiesToUseCase>(),
        gh<_i576.SearchAddressesUseCase>(),
        gh<_i583.GetAllCitiesUseCase>(),
      ),
    );
    gh.factory<_i618.TariffsRemoteSourceImpl>(
      () => _i618.TariffsRemoteSourceImpl(gh<_i1059.TariffsRemoteSource>()),
    );
    gh.factory<_i528.TariffsRepository>(
      () => _i711.TariffsRepositoryImpl(gh<_i618.TariffsRemoteSourceImpl>()),
    );
    gh.lazySingleton<_i214.AuthRepository>(
      () => _i505.AuthRepositoryImpl(gh<_i764.AuthRemoteSource>()),
    );
    gh.lazySingleton<_i919.OrdersRepository>(
      () => _i157.OrdersRepositoryImpl(gh<_i642.OrdersRemoteSource>()),
    );
    gh.factory<_i439.GetUserProfileUseCase>(
      () => _i439.GetUserProfileUseCase(gh<_i214.AuthRepository>()),
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
        gh<_i215.AuthStatusUseCase>(),
        gh<_i439.GetUserProfileUseCase>(),
      ),
    );
    gh.factory<_i910.UploadOrderPhotoUseCase>(
      () => _i910.UploadOrderPhotoUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i189.GetCourierOrdersUseCase>(
      () => _i189.GetCourierOrdersUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i426.CalculateOrderPriceUseCase>(
      () => _i426.CalculateOrderPriceUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i33.GetClientOrdersUseCase>(
      () => _i33.GetClientOrdersUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i49.CreateOrderUseCase>(
      () => _i49.CreateOrderUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i177.GetOrderByIdUseCase>(
      () => _i177.GetOrderByIdUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i1011.GetCreatedOrdersUseCase>(
      () => _i1011.GetCreatedOrdersUseCase(gh<_i919.OrdersRepository>()),
    );
    gh.factory<_i635.PriceCalculationBloc>(
      () => _i635.PriceCalculationBloc(
        calculateOrderPriceUseCase: gh<_i426.CalculateOrderPriceUseCase>(),
      ),
    );
    gh.factory<_i369.CreateTariffUseCase>(
      () => _i369.CreateTariffUseCase(gh<_i528.TariffsRepository>()),
    );
    gh.factory<_i133.GetTariffCategoriesUseCase>(
      () => _i133.GetTariffCategoriesUseCase(gh<_i528.TariffsRepository>()),
    );
    gh.factory<_i837.OrdersBloc>(
      () => _i837.OrdersBloc(
        gh<_i49.CreateOrderUseCase>(),
        gh<_i33.GetClientOrdersUseCase>(),
        gh<_i189.GetCourierOrdersUseCase>(),
        gh<_i1011.GetCreatedOrdersUseCase>(),
        gh<_i177.GetOrderByIdUseCase>(),
      ),
    );
    gh.factory<_i1019.TariffSelectionBloc>(
      () => _i1019.TariffSelectionBloc(
        getTariffCategoriesUseCase: gh<_i133.GetTariffCategoriesUseCase>(),
      ),
    );
    gh.factory<_i545.TariffsBloc>(
      () => _i545.TariffsBloc(gh<_i133.GetTariffCategoriesUseCase>()),
    );
    return this;
  }
}

class _$CoreModule extends _i624.CoreModule {}

class _$DioModule extends _i794.DioModule {}

class _$TariffsModule extends _i584.TariffsModule {}

class _$AuthModule extends _i522.AuthModule {}

class _$DestinationModule extends _i993.DestinationModule {}

class _$OrdersModule extends _i561.OrdersModule {}
