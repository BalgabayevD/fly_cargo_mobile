import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/tariffs/data/repositories/tariffs_repository_impl.dart';
import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source_impl.dart';
import 'package:fly_cargo/shared/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:fly_cargo/shared/tariffs/domain/usecases/get_tariff_categories_usecase.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:get_it/get_it.dart';

class TariffsModule {
  static void configure(GetIt getIt) {
    // Remote Source
    getIt.registerLazySingleton<TariffsRemoteSourceImpl>(
      () => TariffsRemoteSourceImpl(getIt<Dio>(instanceName: 'public-dio')),
    );

    // Repository
    getIt.registerLazySingleton<TariffsRepository>(
      () => TariffsRepositoryImpl(getIt<TariffsRemoteSourceImpl>()),
    );

    // Use Cases
    getIt.registerLazySingleton<GetTariffCategoriesUseCase>(
      () => GetTariffCategoriesUseCase(getIt<TariffsRepository>()),
    );

    // BLoC
    getIt.registerFactory<TariffsBloc>(
      () => TariffsBloc(getIt<GetTariffCategoriesUseCase>()),
    );
  }
}
