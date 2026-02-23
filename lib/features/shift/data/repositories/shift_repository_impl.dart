import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/shift/domain/entities/shift_entity.dart';
import 'package:fly_cargo/features/shift/domain/repositories/shift_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ShiftRepository)
class ShiftRepositoryImpl implements ShiftRepository {
  final Requestable _requestable;
  final Configuration _configuration;

  const ShiftRepositoryImpl(this._requestable, this._configuration);

  String get _baseUrl => _configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<ShiftEntity> getStatus() async {
    final response = await _requestable.dio.get(
      '$_baseUrl/api/v1/user/shift/status',
    );
    return ShiftEntity.fromJson(response.data['data'] as Map<String, Object?>);
  }

  @override
  Future<ShiftEntity> open() async {
    final response = await _requestable.dio.post(
      '$_baseUrl/api/v1/user/shift/open',
    );
    return ShiftEntity.fromJson(response.data['data'] as Map<String, Object?>);
  }

  @override
  Future<ShiftEntity> close() async {
    final response = await _requestable.dio.post(
      '$_baseUrl/api/v1/user/shift/close',
    );
    return ShiftEntity.fromJson(response.data['data'] as Map<String, Object?>);
  }
}
