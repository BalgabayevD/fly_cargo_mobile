import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart';

class GetAllCitiesUseCase {
  final DestinationRepository _destinationRepository;

  GetAllCitiesUseCase(this._destinationRepository);

  Future<List<CityEntity>> call({String? fromCityId}) async {
    try {
      return await _destinationRepository.getAllCities(fromCityId: fromCityId);
    } catch (e) {
      throw DestinationUseCaseException(
        'Ошибка при получении всех городов: $e',
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
