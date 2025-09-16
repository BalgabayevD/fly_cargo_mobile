import 'package:fly_cargo/core/entities/box_entity.dart';

abstract class BoxRepository {
  /// Получить все доступные коробки
  Future<List<BoxEntity>> getAllBoxes();

  /// Получить коробку по ID
  Future<BoxEntity?> getBoxById(String id);

  /// Получить коробку по типу
  Future<BoxEntity?> getBoxByType(String type);
}
