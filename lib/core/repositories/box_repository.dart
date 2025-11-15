import 'package:fly_cargo/core/entities/box_entity.dart';
abstract class BoxRepository {
  Future<List<BoxEntity>> getAllBoxes();
  Future<BoxEntity?> getBoxById(String id);
  Future<BoxEntity?> getBoxByType(String type);
}
