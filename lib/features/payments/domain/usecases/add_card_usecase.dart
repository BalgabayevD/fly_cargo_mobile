import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCardUseCase {
  final PaymentRepository _paymentRepository;

  AddCardUseCase(this._paymentRepository);

  Future<String> call() async {
    return await _paymentRepository.addCard();
  }
}

