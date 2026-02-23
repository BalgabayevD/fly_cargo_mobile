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
import 'package:fly_cargo/core/di/log_level.dart' as _i827;
import 'package:fly_cargo/core/di/package.dart' as _i51;
import 'package:fly_cargo/core/di/requestable.dart' as _i129;
import 'package:fly_cargo/core/l10n/locale_cubit.dart' as _i596;
import 'package:fly_cargo/core/location/location_service.dart' as _i287;
import 'package:fly_cargo/features/accumulator/data/repositories/accumulator_rest_repository.dart'
    as _i539;
import 'package:fly_cargo/features/accumulator/domain/repositories/accumulator_rest_repository.dart'
    as _i401;
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_list_bloc.dart'
    as _i740;
import 'package:fly_cargo/features/accumulator/presentation/bloc/accumulator_scan_bloc.dart'
    as _i535;
import 'package:fly_cargo/features/auth/data/repositories/authorization_repository.dart'
    as _i652;
import 'package:fly_cargo/features/auth/data/sources/local/auth_local_data_source.dart'
    as _i1051;
import 'package:fly_cargo/features/auth/data/sources/remote/auth_remote_data_source.dart'
    as _i822;
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart'
    as _i498;
import 'package:fly_cargo/features/auth/domain/usecases/confirm_otp_usecase.dart'
    as _i58;
import 'package:fly_cargo/features/auth/domain/usecases/get_session_usecase.dart'
    as _i825;
import 'package:fly_cargo/features/auth/domain/usecases/request_otp_usecase.dart'
    as _i142;
import 'package:fly_cargo/features/auth/domain/usecases/sign_out_usecase.dart'
    as _i1002;
import 'package:fly_cargo/features/auth/domain/usecases/update_profile_usecase.dart'
    as _i302;
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart'
    as _i550;
import 'package:fly_cargo/features/courier_identify_order/presentation/bloc/courier_identify_order_bloc.dart'
    as _i264;
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
import 'package:fly_cargo/features/destination/data/repositories/cities_persist_repository.dart'
    as _i166;
import 'package:fly_cargo/features/destination/data/repositories/cities_rest_repository.dart'
    as _i531;
import 'package:fly_cargo/features/destination/domain/repositories/cities_persist_repository.dart'
    as _i193;
import 'package:fly_cargo/features/destination/domain/repositories/cities_rest_repository.dart'
    as _i1025;
import 'package:fly_cargo/features/destination/domain/usecases/cities_use_case.dart'
    as _i542;
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart'
    as _i435;
import 'package:fly_cargo/features/live/data/repositories/live_repository.dart'
    as _i381;
import 'package:fly_cargo/features/live/domain/repositories/live_repository.dart'
    as _i864;
import 'package:fly_cargo/features/live/domain/usecase/live_use_case.dart'
    as _i30;
import 'package:fly_cargo/features/live/presentation/bloc/live_bloc.dart'
    as _i128;
import 'package:fly_cargo/features/orders/data/repositories/client_orders_persist_repository.dart'
    as _i630;
import 'package:fly_cargo/features/orders/data/repositories/client_orders_rest_repository.dart'
    as _i861;
import 'package:fly_cargo/features/orders/data/repositories/courier_orders_persist_repository.dart'
    as _i178;
import 'package:fly_cargo/features/orders/data/repositories/courier_orders_rest_repository.dart'
    as _i885;
import 'package:fly_cargo/features/orders/domain/repositories/client_orders_persist_repository.dart'
    as _i87;
import 'package:fly_cargo/features/orders/domain/repositories/client_orders_rest_repository.dart'
    as _i653;
import 'package:fly_cargo/features/orders/domain/repositories/courier_orders_persist_repository.dart'
    as _i448;
import 'package:fly_cargo/features/orders/domain/repositories/courier_orders_rest_repository.dart'
    as _i697;
import 'package:fly_cargo/features/orders/domain/usecases/client_orders_usecase.dart'
    as _i560;
import 'package:fly_cargo/features/orders/domain/usecases/courier_orders_usecase.dart'
    as _i253;
import 'package:fly_cargo/features/orders/presentation/bloc/client_order_bloc.dart'
    as _i350;
import 'package:fly_cargo/features/orders/presentation/bloc/client_orders_bloc.dart'
    as _i731;
import 'package:fly_cargo/features/orders/presentation/bloc/courier_accept_order_bloc.dart'
    as _i306;
import 'package:fly_cargo/features/orders/presentation/bloc/courier_open_orders_bloc.dart'
    as _i110;
import 'package:fly_cargo/features/orders/presentation/bloc/courier_order_bloc.dart'
    as _i571;
import 'package:fly_cargo/features/orders/presentation/bloc/courier_orders_bloc.dart'
    as _i537;
import 'package:fly_cargo/features/payments/data/repositories/payment_repository.dart'
    as _i759;
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart'
    as _i860;
import 'package:fly_cargo/features/payments/domain/usecases/payment_usecase.dart'
    as _i863;
import 'package:fly_cargo/features/payments/presentation/bloc/payment_cards_bloc.dart'
    as _i593;
import 'package:fly_cargo/features/shift/data/repositories/shift_repository_impl.dart'
    as _i161;
import 'package:fly_cargo/features/shift/domain/repositories/shift_repository.dart'
    as _i517;
import 'package:fly_cargo/features/shift/domain/usecases/close_shift_use_case.dart'
    as _i901;
import 'package:fly_cargo/features/shift/domain/usecases/get_shift_status_use_case.dart'
    as _i1061;
import 'package:fly_cargo/features/shift/domain/usecases/open_shift_use_case.dart'
    as _i685;
import 'package:fly_cargo/features/shift/presentation/bloc/shift_bloc.dart'
    as _i481;
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart'
    as _i182;
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
    gh.lazySingleton<_i287.LocationService>(() => _i287.LocationService());
    gh.singleton<_i596.LocaleCubit>(
      () => _i596.LocaleCubit(gh<_i51.Package>()),
    );
    gh.lazySingleton<_i1051.AuthLocalDataSource>(
      () => _i1051.AuthLocalDataSourceImpl(gh<_i51.Package>()),
    );
    gh.factoryParam<_i156.Configuration, _i827.LogLevel?, dynamic>(
      (logLevel, _) => _i156.Configuration(
        package: gh<_i51.Package>(),
        environmentVariables: gh<_i941.EnvironmentVariables>(),
        logLevel: logLevel,
      ),
    );
    await gh.factoryAsync<_i129.Requestable>(
      () => requestableModule.requestable(gh<_i156.Configuration>()),
      preResolve: true,
    );
    gh.factory<_i672.TariffsRestRepository>(
      () => _i730.TariffsRestRepositoryImpl(
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
    gh.lazySingleton<_i822.AuthRemoteDataSource>(
      () => _i822.AuthRemoteDataSourceImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i176.CreateOrdersRestRepository>(
      () => _i203.CreateOrdersRestRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i517.ShiftRepository>(
      () => _i161.ShiftRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i396.CreateOrdersUseCase>(
      () => _i396.CreateOrdersUseCase(gh<_i176.CreateOrdersRestRepository>()),
    );
    gh.factory<_i498.AuthorizationRepository>(
      () => _i652.AuthorizationRepositoryImpl(
        gh<_i1051.AuthLocalDataSource>(),
        gh<_i822.AuthRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i672.TariffsPersistRepository>(
      () => _i499.TariffsPersistRepositoryImpl(
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i58.ConfirmOtpUseCase>(
      () => _i58.ConfirmOtpUseCase(gh<_i498.AuthorizationRepository>()),
    );
    gh.factory<_i825.GetSessionUseCase>(
      () => _i825.GetSessionUseCase(gh<_i498.AuthorizationRepository>()),
    );
    gh.factory<_i142.RequestOtpUseCase>(
      () => _i142.RequestOtpUseCase(gh<_i498.AuthorizationRepository>()),
    );
    gh.factory<_i1002.SignOutUseCase>(
      () => _i1002.SignOutUseCase(gh<_i498.AuthorizationRepository>()),
    );
    gh.factory<_i302.UpdateProfileUseCase>(
      () => _i302.UpdateProfileUseCase(gh<_i498.AuthorizationRepository>()),
    );
    gh.lazySingleton<_i193.CitiesPersistRepository>(
      () => _i166.CitiesPersistRepositoryImpl(
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.lazySingleton<_i864.LiveRepository>(
      () => _i381.LiveRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i860.PaymentRepository>(
      () => _i759.PaymentRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i87.ClientOrdersPersistRepository>(
      () => _i630.ClientOrdersPersistRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i653.ClientOrdersRestRepository>(
      () => _i861.ClientOrdersRestRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i478.App>(
      () => _i478.App(
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    gh.factory<_i401.AccumulatorRestRepository>(
      () => _i539.AccumulatorRestRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i560.ClientOrdersUseCase>(
      () => _i560.ClientOrdersUseCase(
        gh<_i653.ClientOrdersRestRepository>(),
        gh<_i87.ClientOrdersPersistRepository>(),
      ),
    );
    gh.factory<_i697.CourierOrdersRestRepository>(
      () => _i885.CourierOrdersRestRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i448.CourierOrdersPersistRepository>(
      () => _i178.CourierOrdersPersistRepositoryImpl(
        gh<_i129.Requestable>(),
        gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i740.AccumulatorListBloc>(
      () => _i740.AccumulatorListBloc(gh<_i401.AccumulatorRestRepository>()),
    );
    gh.factory<_i535.AccumulatorScanBloc>(
      () => _i535.AccumulatorScanBloc(gh<_i401.AccumulatorRestRepository>()),
    );
    gh.factory<_i253.CourierOrdersUseCase>(
      () => _i253.CourierOrdersUseCase(
        gh<_i697.CourierOrdersRestRepository>(),
        gh<_i448.CourierOrdersPersistRepository>(),
      ),
    );
    gh.factory<_i30.LiveUseCase>(
      () => _i30.LiveUseCase(gh<_i864.LiveRepository>()),
    );
    gh.factory<_i100.TariffsUseCase>(
      () => _i100.TariffsUseCase(
        gh<_i672.TariffsRestRepository>(),
        gh<_i672.TariffsPersistRepository>(),
      ),
    );
    gh.factory<_i901.CloseShiftUseCase>(
      () => _i901.CloseShiftUseCase(gh<_i517.ShiftRepository>()),
    );
    gh.factory<_i1061.GetShiftStatusUseCase>(
      () => _i1061.GetShiftStatusUseCase(gh<_i517.ShiftRepository>()),
    );
    gh.factory<_i685.OpenShiftUseCase>(
      () => _i685.OpenShiftUseCase(gh<_i517.ShiftRepository>()),
    );
    gh.factory<_i406.OrderPhotosRepository>(
      () => _i756.OrderPhotosRepositoryImpl(
        requestable: gh<_i129.Requestable>(),
        configuration: gh<_i156.Configuration>(),
      ),
    );
    gh.factory<_i550.AuthorizationBloc>(
      () => _i550.AuthorizationBloc(
        getSessionUseCase: gh<_i825.GetSessionUseCase>(),
        requestOtpUseCase: gh<_i142.RequestOtpUseCase>(),
        confirmOtpUseCase: gh<_i58.ConfirmOtpUseCase>(),
        updateProfileUseCase: gh<_i302.UpdateProfileUseCase>(),
        signOutUseCase: gh<_i1002.SignOutUseCase>(),
        configuration: gh<_i156.Configuration>(),
        requestable: gh<_i129.Requestable>(),
      ),
    );
    gh.factory<_i103.OrderPhotosUseCase>(
      () => _i103.OrderPhotosUseCase(gh<_i406.OrderPhotosRepository>()),
    );
    gh.factory<_i731.ClientOrdersBloc>(
      () => _i731.ClientOrdersBloc(gh<_i560.ClientOrdersUseCase>()),
    );
    gh.factory<_i863.PaymentUseCase>(
      () => _i863.PaymentUseCase(gh<_i860.PaymentRepository>()),
    );
    gh.factory<_i542.CitiesUseCase>(
      () => _i542.CitiesUseCase(
        gh<_i1025.CitiesRestRepository>(),
        gh<_i193.CitiesPersistRepository>(),
      ),
    );
    gh.factory<_i266.TariffsBloc>(
      () => _i266.TariffsBloc(gh<_i100.TariffsUseCase>()),
    );
    gh.factory<_i128.LiveBloc>(() => _i128.LiveBloc(gh<_i30.LiveUseCase>()));
    gh.factory<_i593.PaymentCardsBloc>(
      () => _i593.PaymentCardsBloc(gh<_i863.PaymentUseCase>()),
    );
    gh.factory<_i32.CreateOrdersBloc>(
      () => _i32.CreateOrdersBloc(
        gh<_i396.CreateOrdersUseCase>(),
        gh<_i542.CitiesUseCase>(),
      ),
    );
    gh.factory<_i264.CourierIdentifyOrderBloc>(
      () => _i264.CourierIdentifyOrderBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i306.CourierAcceptOrderBloc>(
      () => _i306.CourierAcceptOrderBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i110.CourierOpenOrdersBloc>(
      () => _i110.CourierOpenOrdersBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i571.CourierOrderBloc>(
      () => _i571.CourierOrderBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i537.CourierOrdersBloc>(
      () => _i537.CourierOrdersBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i182.CourierSubmitOrderBloc>(
      () => _i182.CourierSubmitOrderBloc(gh<_i253.CourierOrdersUseCase>()),
    );
    gh.factory<_i481.ShiftBloc>(
      () => _i481.ShiftBloc(
        gh<_i1061.GetShiftStatusUseCase>(),
        gh<_i685.OpenShiftUseCase>(),
        gh<_i901.CloseShiftUseCase>(),
      ),
    );
    gh.factory<_i435.CitiesBloc>(
      () => _i435.CitiesBloc(gh<_i542.CitiesUseCase>()),
    );
    gh.factory<_i350.ClientOrderBloc>(
      () => _i350.ClientOrderBloc(
        gh<_i560.ClientOrdersUseCase>(),
        gh<_i863.PaymentUseCase>(),
      ),
    );
    gh.factory<_i298.PhotosBloc>(
      () => _i298.PhotosBloc(gh<_i103.OrderPhotosUseCase>()),
    );
    return this;
  }
}

class _$EnvironmentVariablesModule extends _i941.EnvironmentVariablesModule {}

class _$PackageModule extends _i51.PackageModule {}

class _$RequestableModule extends _i129.RequestableModule {}
