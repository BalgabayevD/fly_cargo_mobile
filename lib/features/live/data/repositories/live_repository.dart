import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/live/domain/repositories/live_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LiveRepository)
class LiveRepositoryImpl implements LiveRepository {
  final Requestable requestable;
  final Configuration configuration;

  const LiveRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<bool> logLive() async {
    try {
      final response = await requestable.dio.get('$_/live');
      return response.data['data']['success'] as bool;
    } catch (e) {
      rethrow;
    }
  }
}
