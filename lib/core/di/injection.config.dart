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
import 'package:fly_cargo/features/create_order/data/repository/create_order_repository.dart'
    as _i203;
import 'package:fly_cargo/features/create_order/data/repository/order_photos_repository.dart'
    as _i756;
import 'package:fly_cargo/features/create_order/data/repository/tariffs_persist_repository.dart'
    as _i499;
import 'package:fly_cargo/features/create_order/data/repository/tariffs_rest_repository.dart'
    as _i730;
import 'package:fly_cargo/features/create_order/domain/repositories/create_orders_repository.dart'
    as _i176;
import 'package:fly_cargo/features/create_order/domain/repositories/order_photos_repository.dart'
    as _i406;
import 'package:fly_cargo/features/create_order/domain/repositories/tariffs_repository.dart'
    as _i672;
import 'package:fly_cargo/features/create_order/domain/usecases/create_orders_usecase.dart'
    as _i396;
import 'package:fly_cargo/features/create_order/domain/usecases/order_photos_usecase.dart'
    as _i103;
import 'package:fly_cargo/features/create_order/domain/usecases/tariffs_usecase.dart'
    as _i100;
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart'
    as _i32;
import 'package:fly_cargo/features/create_order/presentation/bloc/photos_bloc.dart'
    as _i298;
import 'package:fly_cargo/features/create_order/presentation/bloc/tariffs_bloc.dart'
    as _i266;
import 'package:fly_cargo/features/destination/config/destination_module.dart'
    as _i1065;
import 'package:fly_cargo/features/destination/data/destination_remote_source.dart'
    as _i117;
import 'package:fly_cargo/features/destination/data/repositories/cities_persist_repository.dart'
    as _i166;
import 'package:fly_cargo/features/destination/data/repositories/cities_rest_repository.dart'
    as _i531;
import 'package:fly_cargo/features/destination/data/repositories/destination_repository_impl.dart'
    as _i624;
import 'package:fly_cargo/features/destination/domain/repositories/cities_persist_repository.dart'
    as _i193;
import 'package:fly_cargo/features/destination/domain/repositories/cities_rest_repository.dart'
    as _i1025;
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart'
    as _i933;
import 'package:fly_cargo/features/destination/domain/usecases/cities_use_case.dart'
    as _i542;
import 'package:fly_cargo/features/destination/domain/usecases/get_all_cities_usecase.dart'
    as _i55;
import 'package:fly_cargo/features/destination/domain/usecases/get_cities_from_usecase.dart'
    as _i331;
import 'package:fly_cargo/features/destination/domain/usecases/get_cities_to_usecase.dart'
    as _i760;
import 'package:fly_cargo/features/destination/domain/usecases/search_addresses_usecase.dart'
    as _i801;
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart'
    as _i435;
import 'package:fly_cargo/features/orders/config/orders_module.dart' as _i142;
import 'package:fly_cargo/features/orders/domain/usecases/get_client_orders_usecase.dart'
    as _i899;
import 'package:fly_cargo/features/orders/domain/usecases/get_courier_orsers_usecase.dart'
    as _i918;
import 'package:fly_cargo/features/orders/domain/usecases/get_created_orders_usecase.dart'
    as _i698;
import 'package:fly_cargo/features/orders/domain/usecases/get_order_by_id_usecase.dart'
    as _i1009;
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart'
    as _i290;
import 'package:fly_cargo/features/payments/config/payment_module.dart'
    as _i220;
import 'package:fly_cargo/features/payments/data/repositories/payment_repository_impl.dart'
    as _i733;
import 'package:fly_cargo/features/payments/data/sources/payment_remoute_source.dart'
    as _i777;
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart'
    as _i860;
import 'package:fly_cargo/features/payments/domain/usecases/add_card_usecase.dart'
    as _i355;
import 'package:fly_cargo/features/payments/domain/usecases/fetch_cards_usecase.dart'
    as _i974;
import 'package:fly_cargo/features/payments/domain/usecases/pay_order_usecase.dart'
    as _i298;
import 'package:fly_cargo/features/payments/presentation/add_card/bloc/add_card_bloc.dart'
    as _i191;
import 'package:fly_cargo/features/payments/presentation/cards_list/bloc/cards_list_bloc.dart'
    as _i91;
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_bloc.dart'
    as _i221;
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart'
    as _i1004;
import 'package:fly_cargo/features/shared/orders/config/shared_orders_module.dart'
    as _i713;
import 'package:fly_cargo/features/shared/orders/data/orders_remote_source.dart'
    as _i436;
import 'package:fly_cargo/features/shared/orders/domain/repositories/orders_repository.dart'
    as _i598;
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
    final paymentModule = _$PaymentModule();
    final requestableModule = _$RequestableModule();
    final destinationModule = _$DestinationModule();
    final sharedOrdersModule = _$SharedOrdersModule();
    final ordersModule = _$OrdersModule();
    await gh.factoryAsync<_i941.EnvironmentVariables>(
      () => environmentVariablesModule.environmentVariables(),
      preResolve: true,
    );
    await gh.factoryAsync<_i51.Package>(
      () => packageModule.appConfig,
      preResolve: true,
    );
    gh.factory<_i1004.PaymentFlowCubit>(() => paymentModule.paymentFlowCubit());
    gh.singleton<_i596.LocaleCubit>(
      () => _i596.LocaleCubit(gh<_i51.Package>()),
    );
    gh.factory<_i156.Configuration>(
      () => _i156.Configuration(
        package: gh<_i51.Package>(),
        environmentVariables: gh<_i941.EnvironmentVariables>(),
      ),
    );
    gh.lazySingleton<_i193.CitiesPersistRepository>(
      () => _i166.CitiesPersistRepositoryImpl(
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.lazySingleton<_i672.TariffsPersistRepository>(
      () => _i499.TariffsPersistRepositoryImpl(
        configuration: gh<_i156.Configuration>(),
      ),
    );
    await gh.factoryAsync<_i129.Requestable>(
      () => requestableModule.requestable(gh<_i156.Configuration>()),
      preResolve: true,
    );
    gh.factory<_i777.PaymentRemoteSource>(
      () => paymentModule.providePaymentRemoteSource(gh<_i129.Requestable>()),
    );
    gh.factory<_i176.CreateOrdersRestRepository>(
      () => _i203.CreateOrdersRestRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.lazySingleton<_i1025.CitiesRestRepository>(
      () => _i531.CitiesRestRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i672.TariffsRestRepository>(
      () => _i730.TariffsRestRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i406.OrderPhotosRepository>(
      () => _i756.OrderPhotosRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i478.App>(
      () => _i478.App(
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    gh.lazySingleton<_i860.PaymentRepository>(
      () => _i733.PaymentRepositoryImpl(gh<_i777.PaymentRemoteSource>()),
    );
    gh.factory<_i498.AuthorizationRepository>(
      () => _i652.AuthorizationRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i117.DestinationRemoteSource>(
      () => destinationModule.provideDestinationRemoteSource(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i436.OrdersRemoteSource>(
      () => sharedOrdersModule.ordersRemoteSource(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i542.CitiesUseCase>(
      () => _i542.CitiesUseCase(
        gh<_i1025.CitiesRestRepository>(),
        gh<_i193.CitiesPersistRepository>(),
      ),
    );
    gh.factory<_i100.TariffsUseCase>(
      () => _i100.TariffsUseCase(
        gh<_i672.TariffsRestRepository>(),
        gh<_i672.TariffsPersistRepository>(),
      ),
    );
    gh.factory<_i396.CreateOrdersUseCase>(
      () => _i396.CreateOrdersUseCase(gh<_i176.CreateOrdersRestRepository>()),
    );
    gh.factory<_i103.OrderPhotosUseCase>(
      () => _i103.OrderPhotosUseCase(gh<_i406.OrderPhotosRepository>()),
    );
    gh.factory<_i435.CitiesBloc>(
      () => _i435.CitiesBloc(gh<_i542.CitiesUseCase>()),
    );
    gh.factory<_i355.AddCardUseCase>(
      () => _i355.AddCardUseCase(gh<_i860.PaymentRepository>()),
    );
    gh.factory<_i974.FetchCardsUseCase>(
      () => _i974.FetchCardsUseCase(gh<_i860.PaymentRepository>()),
    );
    gh.factory<_i298.PayOrderUseCase>(
      () => _i298.PayOrderUseCase(gh<_i860.PaymentRepository>()),
    );
    gh.factory<_i191.AddCardBloc>(
      () => _i191.AddCardBloc(gh<_i355.AddCardUseCase>()),
    );
    gh.factory<_i32.CreateOrdersBloc>(
      () => _i32.CreateOrdersBloc(gh<_i396.CreateOrdersUseCase>()),
    );
    gh.lazySingleton<_i933.DestinationRepository>(
      () =>
          _i624.DestinationRepositoryImpl(gh<_i117.DestinationRemoteSource>()),
    );
    gh.factory<_i298.PhotosBloc>(
      () => _i298.PhotosBloc(gh<_i103.OrderPhotosUseCase>()),
    );
    gh.factory<_i550.AuthorizationBloc>(
      () => _i550.AuthorizationBloc(
        authorizationRepository: gh<_i498.AuthorizationRepository>(),
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    gh.factory<_i598.OrdersRepository>(
      () => sharedOrdersModule.ordersRepository(
        gh<_i436.OrdersRemoteSource>(),
        gh<_i129.Requestable>(),
      ),
    );
    gh.factory<_i899.GetClientOrdersUseCase>(
      () => ordersModule.getClientOrdersUseCase(gh<_i598.OrdersRepository>()),
    );
    gh.factory<_i918.GetCourierOrdersUseCase>(
      () => ordersModule.getCourierOrdersUseCase(gh<_i598.OrdersRepository>()),
    );
    gh.factory<_i698.GetCreatedOrdersUseCase>(
      () => ordersModule.getCreatedOrdersUseCase(gh<_i598.OrdersRepository>()),
    );
    gh.factory<_i1009.GetOrderByIdUseCase>(
      () => ordersModule.getOrderByIdUseCase(gh<_i598.OrdersRepository>()),
    );
    gh.factory<_i290.OrdersListBloc>(
      () => ordersModule.ordersListBloc(
        gh<_i899.GetClientOrdersUseCase>(),
        gh<_i918.GetCourierOrdersUseCase>(),
        gh<_i698.GetCreatedOrdersUseCase>(),
        gh<_i1009.GetOrderByIdUseCase>(),
      ),
    );
    gh.factory<_i55.GetAllCitiesUseCase>(
      () => _i55.GetAllCitiesUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i331.GetCitiesFromUseCase>(
      () => _i331.GetCitiesFromUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i760.GetCitiesToUseCase>(
      () => _i760.GetCitiesToUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i801.SearchAddressesUseCase>(
      () => _i801.SearchAddressesUseCase(gh<_i933.DestinationRepository>()),
    );
    gh.factory<_i221.EpaymentPayBloc>(
      () => _i221.EpaymentPayBloc(gh<_i298.PayOrderUseCase>()),
    );
    gh.factory<_i266.TariffsBloc>(
      () => _i266.TariffsBloc(gh<_i100.TariffsUseCase>()),
    );
    gh.factory<_i91.CardsListBloc>(
      () => _i91.CardsListBloc(gh<_i974.FetchCardsUseCase>()),
    );
    return this;
  }
}

class _$EnvironmentVariablesModule extends _i941.EnvironmentVariablesModule {}

class _$PackageModule extends _i51.PackageModule {}

class _$PaymentModule extends _i220.PaymentModule {}

class _$RequestableModule extends _i129.RequestableModule {}

class _$DestinationModule extends _i1065.DestinationModule {}

class _$SharedOrdersModule extends _i713.SharedOrdersModule {}

class _$OrdersModule extends _i142.OrdersModule {}
