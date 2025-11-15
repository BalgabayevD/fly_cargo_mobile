import 'package:fly_cargo/core/entities/box_entity.dart';
abstract class BoxLocalDataSource {
  List<BoxEntity> getAllBoxes();
  BoxEntity? getBoxByType(String type);
}
class BoxLocalDataSourceImpl implements BoxLocalDataSource {
  static const List<BoxEntity> _boxes = [
    BoxEntity(
      id: 'small',
      name: 'Маленькая коробка',
      dimensions: '15 × 10 × 20 см',
      description:
          'Идеально подходит для небольших предметов: документы, книги, небольшие сувениры, косметика. Компактный размер обеспечивает экономичную доставку.',
      imagePath: 'assets/images/small.png',
      basePrice: 3500.0,
      currency: '₸',
    ),
    BoxEntity(
      id: 'medium',
      name: 'Средняя коробка',
      dimensions: '20 × 20 × 30 см',
      description:
          'Универсальный размер для большинства посылок: одежда, обувь, электроника, бытовая техника. Оптимальное соотношение размера и стоимости.',
      imagePath: 'assets/images/medium.png',
      basePrice: 5500.0,
      currency: '₸',
    ),
    BoxEntity(
      id: 'big',
      name: 'Большая коробка',
      dimensions: '30 × 30 × 40 см',
      description:
          'Для крупных и объемных предметов: крупная бытовая техника, мебель, спортивный инвентарь. Максимальная вместимость для ваших посылок.',
      imagePath: 'assets/images/big.png',
      basePrice: 8500.0,
      currency: '₸',
    ),
  ];
  @override
  List<BoxEntity> getAllBoxes() {
    return List.from(_boxes);
  }
  @override
  BoxEntity? getBoxByType(String type) {
    try {
      return _boxes.firstWhere((box) => box.id == type);
    } catch (e) {
      return null;
    }
  }
}
