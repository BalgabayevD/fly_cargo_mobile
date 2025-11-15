import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/core/repositories/box_repository.dart';

class GetBoxByTypeUseCase {
  final BoxRepository _repository;

  const GetBoxByTypeUseCase(this._repository);


  Future<BoxEntity?> call(String boxType) async {
    return await _repository.getBoxByType(boxType);
  }
}
