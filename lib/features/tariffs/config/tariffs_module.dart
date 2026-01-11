import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/tariffs/data/tariffs_remote_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TariffsModule {
  @factoryMethod
  TariffsRemoteSource provideTariffsRemoteSource(
    Requestable requestable,
    Configuration configuration,
  ) {
    return TariffsRemoteSource(
      requestable,
      baseUrl: configuration.environmentVariables.orderBaseUrl,
    );
  }
}
