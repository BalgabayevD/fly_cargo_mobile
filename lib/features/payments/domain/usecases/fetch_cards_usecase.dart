import 'package:fly_cargo/features/payments/domain/entities/card.dart';
import 'package:fly_cargo/features/payments/domain/repositories/payment_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchCardsUseCase {
  final PaymentRepository _paymentRepository;

  FetchCardsUseCase(this._paymentRepository);

  Future<List<Card>> call() async {
    return await _paymentRepository.fetchCards();
  }
}

