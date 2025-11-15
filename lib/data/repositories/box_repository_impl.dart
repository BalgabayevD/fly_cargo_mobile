import 'package:fly_cargo/core/entities/box_entity.dart';
import 'package:fly_cargo/core/repositories/box_repository.dart';
import 'package:fly_cargo/data/datasources/box_local_datasource.dart';
class BoxRepositoryImpl implements BoxRepository {
  final BoxLocalDataSource _localDataSource;
  const BoxRepositoryImpl(this._localDataSource);
  @override
  Future<List<BoxEntity>> getAllBoxes() async {
    return _localDataSource.getAllBoxes();
  }
  @override
  Future<BoxEntity?> getBoxById(String id) async {
    final boxes = _localDataSource.getAllBoxes();
    try {
      return boxes.firstWhere((box) => box.id == id);
    } catch (e) {
      return null;
    }
  }
  @override
  Future<BoxEntity?> getBoxByType(String type) async {
    return _localDataSource.getBoxByType(type);
  }
}
