import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';

class OrderValidator {
  static String? validateSubmitOrder({
    required AddressModel? fromAddress,
    required AddressModel? toAddress,
    required String? recipientName,
    required String? recipientPhone,
    required int? selectedTariffId,
    required TariffModel? selectedTariff,
    required String? description,
  }) {
    if (fromAddress == null || toAddress == null) {
      return 'Укажите адреса отправки и доставки';
    }

    if (recipientName == null || recipientPhone == null) {
      return 'Укажите данные получателя';
    }

    if (selectedTariffId == null || selectedTariff == null) {
      return 'Выберите тариф';
    }

    if (description == null || description.isEmpty) {
      return 'Укажите описание посылки';
    }

    return null;
  }
}

