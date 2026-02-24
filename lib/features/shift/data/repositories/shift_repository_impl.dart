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

  ShiftEntity _mapShift(Map<String, Object?> data) {
    return ShiftEntity(
      isActive: data['close'] == null,
      openedAt: data['open'] as String?,
      closedAt: data['close'] as String?,
    );
  }

  @override
  Future<ShiftEntity> getStatus() async {
    final response = await _requestable.dio.get(
      '$_baseUrl/shift/status',
    );
    final data = response.data['data'];
    if (data == null) return const ShiftEntity(isActive: false);
    return _mapShift(data as Map<String, Object?>);
  }

  @override
  Future<ShiftEntity> open() async {
    final response = await _requestable.dio.post(
      '$_baseUrl/shift/open',
    );
    return _mapShift(response.data['data'] as Map<String, Object?>);
  }

  @override
  Future<ShiftEntity> close() async {
    final response = await _requestable.dio.post(
      '$_baseUrl/shift/close',
    );
    return _mapShift(response.data['data'] as Map<String, Object?>);
  }
}
