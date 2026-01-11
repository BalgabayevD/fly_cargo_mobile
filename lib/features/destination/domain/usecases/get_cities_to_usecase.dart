import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCitiesToUseCase {
  final DestinationRepository _destinationRepository;

  GetCitiesToUseCase(this._destinationRepository);

  Future<List<CityEntity>> call({required String fromCityId}) async {
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
