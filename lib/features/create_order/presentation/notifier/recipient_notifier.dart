import 'package:flutter/foundation.dart';
import 'package:fly_cargo/features/create_order/presentation/enitites/recipient_entity.dart';

class RecipientNotifier extends ChangeNotifier {
  RecipientEntity recipient;

  RecipientNotifier({RecipientEntity? recipient})
    : recipient = recipient ?? RecipientEntity();

  void setRecipient(RecipientEntity value) {
    recipient = value;
    notifyListeners();
  }

  void setName(String name) {
    recipient = recipient.copyWith(name: name);
    notifyListeners();
  }

  void setPhone(String phone) {
    recipient = recipient.copyWith(phone: phone);
    notifyListeners();
  }
}
