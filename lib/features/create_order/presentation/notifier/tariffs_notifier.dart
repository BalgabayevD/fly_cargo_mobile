import 'package:flutter/foundation.dart';
import 'package:fly_cargo/features/destination/domain/entities/tariffs_entity.dart';

class TariffsNotifier extends ChangeNotifier {
  TariffsEntity tariffs;

  TariffsNotifier({TariffsEntity? tariffs})
    : tariffs = tariffs ?? TariffsEntity.empty();

  void selectTariff(int tariffId) {
    tariffs = tariffs.copyWith(selectedTariffId: tariffId);
    notifyListeners();
  }
}
