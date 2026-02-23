import 'package:fly_cargo/features/shift/domain/entities/shift_entity.dart';

abstract interface class ShiftRepository {
  Future<ShiftEntity> getStatus();
  Future<ShiftEntity> open();
  Future<ShiftEntity> close();
}
