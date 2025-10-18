import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCitiesToUseCase {
  final DestinationRepository _destinationRepository;

  GetCitiesToUseCase(this._destinationRepository);

  /// Получает список городов доставки для конкретного города отправки
  Future<List<CityModel>> call({required String fromCityId}) async {
    if (fromCityId.isEmpty) {
      throw ArgumentError('ID города отправки не может быть пустым');
    }

    try {
      return await _destinationRepository.getCitiesTo(fromCityId: fromCityId);
    } catch (e) {
      throw DestinationUseCaseException(
        'Ошибка при получении городов доставки: $e',
      );
    }
  }
}

class DestinationUseCaseException implements Exception {
  final String message;

  const DestinationUseCaseException(this.message);

  @override
  String toString() => 'DestinationUseCaseException: $message';
}
