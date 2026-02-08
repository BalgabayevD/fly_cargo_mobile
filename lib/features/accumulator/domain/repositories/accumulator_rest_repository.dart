import 'package:fly_cargo/features/accumulator/domain/entities/accumulator_entity.dart';

abstract class AccumulatorRestRepository {
  Future<List<AccumulatorEntity>> getAll({
    int? limit,
    int? offset,
    String? sortField,
    String? sortOrder,
  });

  Future<AccumulatorEntity?> getById(int accumulatorId);

  Future<AccumulatorEntity?> getByIdentification(String identification);

  Future<AccumulatorEntity?> addOrderToOpen({
    required int orderId,
    required int fromCityId,
    required int toCityId,
  });

  Future<AccumulatorEntity?> close(int accumulatorId);

  Future<AccumulatorEntity?> arrived(String identification);
}
