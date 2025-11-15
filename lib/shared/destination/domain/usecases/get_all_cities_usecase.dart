import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCitiesUseCase {
  final DestinationRepository _destinationRepository;

  GetAllCitiesUseCase(this._destinationRepository);


  Future<List<CityModel>> call({String? fromCityId}) async {
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
