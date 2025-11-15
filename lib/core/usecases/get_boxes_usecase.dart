import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/core/repositories/box_repository.dart';

class GetBoxesUseCase {
  final BoxRepository _repository;

  const GetBoxesUseCase(this._repository);


  Future<List<BoxEntity>> call() async {
    return await _repository.getAllBoxes();
  }
}
