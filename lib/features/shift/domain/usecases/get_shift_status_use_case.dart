import 'package:fly_cargo/features/shift/domain/entities/shift_entity.dart';
import 'package:fly_cargo/features/shift/domain/repositories/shift_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetShiftStatusUseCase {
  final ShiftRepository _repository;

  GetShiftStatusUseCase(this._repository);

  Future<ShiftEntity> call() => _repository.getStatus();
}
