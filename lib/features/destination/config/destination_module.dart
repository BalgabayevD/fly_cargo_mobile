import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/destination/data/destination_remote_source.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DestinationModule {
  @factoryMethod
  DestinationRemoteSource provideDestinationRemoteSource(
    Requestable requestable,
    Configuration configuration,
  ) {
    return DestinationRemoteSource(
      requestable.dio,
      baseUrl: configuration.environmentVariables.orderBaseUrl,
    );
  }
}
