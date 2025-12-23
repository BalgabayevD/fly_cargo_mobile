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
import 'package:fly_cargo/core/network/pre_order_dio_client.dart' as _i515;
import 'package:fly_cargo/features/auth/config/auth_module.dart' as _i800;
import 'package:fly_cargo/features/auth/data/auth_remote_source.dart' as _i489;
import 'package:fly_cargo/features/auth/data/repositories/auth_repository_impl.dart'
    as _i351;
import 'package:fly_cargo/features/auth/domain/repositories/auth_repository.dart'
    as _i793;
import 'package:fly_cargo/features/auth/domain/usecases/auth_status_usecase.dart'
    as _i856;
import 'package:fly_cargo/features/auth/domain/usecases/get_user_profile_usecase.dart'
    as _i349;
import 'package:fly_cargo/features/auth/domain/usecases/sign_code_usecase.dart'
    as _i441;
import 'package:fly_cargo/features/auth/domain/usecases/sign_in_usecase.dart'
    as _i885;
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart'
    as _i505;
import 'package:fly_cargo/features/destination/config/destination_module.dart'
    as _i1065;
import 'package:fly_cargo/features/destination/data/destination_remote_source.dart'
    as _i117;
import 'package:fly_cargo/features/destination/data/repositories/destination_repository_impl.dart'
    as _i624;
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart'
    as _i933;
import 'package:fly_cargo/features/destination/domain/usecases/get_all_cities_usecase.dart'
    as _i55;
import 'package:fly_cargo/features/destination/domain/usecases/get_cities_from_usecase.dart'
    as _i331;
import 'package:fly_cargo/features/destination/domain/usecases/get_cities_to_usecase.dart'
    as _i760;
import 'package:fly_cargo/features/destination/domain/usecases/search_addresses_usecase.dart'
    as _i801;
import 'package:fly_cargo/features/destination/presentation/bloc/destination_bloc.dart'
    as _i577;
import 'package:fly_cargo/features/orders/config/orders_module.dart' as _i142;
import 'package:fly_cargo/features/orders/data/orders_remote_source.dart'
    as _i180;
import 'package:fly_cargo/features/orders/data/repositories/orders_repository_impl.dart'
    as _i554;
import 'package:fly_cargo/features/orders/domain/repositories/orders_repository.dart'
    as _i27;
import 'package:fly_cargo/features/orders/domain/usecases/calculate_order_price_usecase.dart'
    as _i662;
import 'package:fly_cargo/features/orders/domain/usecases/create_order_usecase.dart'
    as _i977;
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart'
    as _i899;
import 'package:fly_cargo/features/orders/domain/usecases/get_courier_orsers_usecase.dart'
    as _i918;
import 'package:fly_cargo/features/orders/domain/usecases/get_created_orders_usecase.dart'
    as _i698;
import 'package:fly_cargo/features/orders/domain/usecases/get_order_by_id_usecase.dart'
    as _i1009;
import 'package:fly_cargo/features/orders/domain/usecases/pre_create_order_usecase.dart'
    as _i511;
import 'package:fly_cargo/features/orders/domain/usecases/upload_order_photo_usecase.dart'
    as _i329;
import 'package:fly_cargo/features/orders/presentation/bloc/orders_bloc.dart'
    as _i648;
import 'package:fly_cargo/features/orders/presentation/bloc/price_calculation_bloc.dart'
    as _i132;
import 'package:fly_cargo/features/tariff/presentation/bloc/tariff_selection_bloc.dart'
    as _i521;
import 'package:fly_cargo/features/tariffs/config/tariffs_module.dart'
    as _i1017;
import 'package:fly_cargo/features/tariffs/data/repositories/tariffs_repository_impl.dart'
    as _i720;
import 'package:fly_cargo/features/tariffs/data/tariffs_remote_source.dart'
    as _i384;
import 'package:fly_cargo/features/tariffs/data/tariffs_remote_source_impl.dart'
    as _i1062;
import 'package:fly_cargo/features/tariffs/domain/repositories/tariffs_repository.dart'
    as _i170;
import 'package:fly_cargo/features/tariffs/domain/usecases/create_tariff_usecase.dart'
    as _i113;
import 'package:fly_cargo/features/tariffs/domain/usecases/get_tariff_categories_usecase.dart'
    as _i217;
import 'package:fly_cargo/features/tariffs/presentation/bloc/tariffs_bloc.dart'
    as _i563;
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
    final authModule = _$AuthModule();
    final destinationModule = _$DestinationModule();
    final ordersModule = _$OrdersModule();
    final tariffsModule = _$TariffsModule();
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
    gh.lazySingleton<_i515.PreOrderDioClient>(
      () => _i515.PreOrderDioClient(
        gh<_i361.Interceptor>(instanceName: 'log-interceptor'),
        gh<_i361.Interceptor>(instanceName: 'auth-interceptor'),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.getPrivateDio(
        gh<_i361.Interceptor>(instanceName: 'log-interceptor'),
        gh<_i361.Interceptor>(instanceName: 'auth-interceptor'),
      ),
      instanceName: 'private-dio',
    );
    gh.factory<_i489.AuthRemoteSource>(
      () => authModule.provideAuthRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i117.DestinationRemoteSource>(
      () => destinationModule.provideDestinationRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i180.OrdersRemoteSource>(
      () => ordersModule.provideOrdersRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.factory<_i384.TariffsRemoteSource>(
      () => tariffsModule.provideTariffsRemoteSource(
        gh<_i361.Dio>(instanceName: 'private-dio'),
        gh<_i469.ApiConfig>(),
      ),
    );
    gh.lazySingleton<_i793.AuthRepository>(
      () => _i351.AuthRepositoryImpl(gh<_i489.AuthRemoteSource>()),
    );
    gh.lazySingleton<_i933.DestinationRepository>(
      () =>
          _i624.DestinationRepositoryImpl(gh<_i117.DestinationRemoteSource>()),
    );
    gh.factory<_i349.GetUserProfileUseCase>(
      () => _i349.GetUserProfileUseCase(gh<_i793.AuthRepository>()),
    );
    gh.factory<_i441.SignCodeUseCase>(
      () => _i441.SignCodeUseCase(gh<_i793.AuthRepository>()),
    );
    gh.factory<_i885.SignInUseCase>(
      () => _i885.SignInUseCase(gh<_i793.AuthRepository>()),
    );
    gh.factory<_i856.AuthStatusUseCase>(
      () => _i856.AuthStatusUseCase(gh<_i793.AuthRepository>()),
    );
    gh.lazySingleton<_i27.OrdersRepository>(
      () => _i554.OrdersRepositoryImpl(
        gh<_i180.OrdersRemoteSource>(),
        gh<_i515.PreOrderDioClient>(),
      ),
    );
    gh.factory<_i505.AuthBloc>(
      () => _i505.AuthBloc(
        gh<_i885.SignInUseCase>(),
        gh<_i856.AuthStatusUseCase>(),
        gh<_i349.GetUserProfileUseCase>(),
      ),
    );
    gh.factory<_i329.UploadOrderPhotoUseCase>(
      () => _i329.UploadOrderPhotoUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i918.GetCourierOrdersUseCase>(
      () => _i918.GetCourierOrdersUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i1009.GetOrderByIdUseCase>(
      () => _i1009.GetOrderByIdUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i662.CalculateOrderPriceUseCase>(
      () => _i662.CalculateOrderPriceUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i899.GetClientOrdersUseCase>(
      () => _i899.GetClientOrdersUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i977.CreateOrderUseCase>(
      () => _i977.CreateOrderUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i698.GetCreatedOrdersUseCase>(
      () => _i698.GetCreatedOrdersUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i511.PreCreateOrderUseCase>(
      () => _i511.PreCreateOrderUseCase(gh<_i27.OrdersRepository>()),
    );
    gh.factory<_i132.PriceCalculationBloc>(
      () => _i132.PriceCalculationBloc(
        calculateOrderPriceUseCase: gh<_i662.CalculateOrderPriceUseCase>(),
      ),
    );
    gh.factory<_i760.GetCitiesToUseCase>(
      () => _i760.GetCitiesToUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i801.SearchAddressesUseCase>(
      () => _i801.SearchAddressesUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i55.GetAllCitiesUseCase>(
      () => _i55.GetAllCitiesUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i331.GetCitiesFromUseCase>(
      () => _i331.GetCitiesFromUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i1062.TariffsRemoteSourceImpl>(
      () => _i1062.TariffsRemoteSourceImpl(gh<_i384.TariffsRemoteSource>()),
    );
    gh.factory<_i170.TariffsRepository>(
      () => _i720.TariffsRepositoryImpl(gh<_i1062.TariffsRemoteSourceImpl>()),
    );
    gh.factory<_i577.DestinationBloc>(
      () => _i577.DestinationBloc(
        gh<_i331.GetCitiesFromUseCase>(),
        gh<_i760.GetCitiesToUseCase>(),
        gh<_i801.SearchAddressesUseCase>(),
        gh<_i55.GetAllCitiesUseCase>(),
      ),
    );
    gh.factory<_i217.GetTariffCategoriesUseCase>(
      () => _i217.GetTariffCategoriesUseCase(gh<_i170.TariffsRepository>()),
    );
    gh.factory<_i648.OrdersBloc>(
      () => _i648.OrdersBloc(
        gh<_i977.CreateOrderUseCase>(),
        gh<_i511.PreCreateOrderUseCase>(),
        gh<_i899.GetClientOrdersUseCase>(),
        gh<_i918.GetCourierOrdersUseCase>(),
        gh<_i698.GetCreatedOrdersUseCase>(),
        gh<_i1009.GetOrderByIdUseCase>(),
      ),
    );
    gh.factory<_i113.CreateTariffUseCase>(
      () => _i113.CreateTariffUseCase(gh<_i170.TariffsRepository>()),
    );
    gh.factory<_i521.TariffSelectionBloc>(
      () => _i521.TariffSelectionBloc(
        getTariffCategoriesUseCase: gh<_i217.GetTariffCategoriesUseCase>(),
      ),
    );
    gh.factory<_i563.TariffsBloc>(
      () => _i563.TariffsBloc(gh<_i217.GetTariffCategoriesUseCase>()),
    );
    return this;
  }
}

class _$CoreModule extends _i624.CoreModule {}

class _$DioModule extends _i794.DioModule {}

class _$AuthModule extends _i800.AuthModule {}

class _$DestinationModule extends _i1065.DestinationModule {}

class _$OrdersModule extends _i142.OrdersModule {}

class _$TariffsModule extends _i1017.TariffsModule {}
