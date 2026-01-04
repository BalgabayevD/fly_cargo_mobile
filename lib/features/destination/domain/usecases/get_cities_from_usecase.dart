import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCitiesFromUseCase {
  final DestinationRepository _destinationRepository;

  GetCitiesFromUseCase(this._destinationRepository);

  Future<List<CityEntity>> call() async {
    try {
      return await _destinationRepository.getCitiesFrom();
    } catch (e) {
      throw DestinationUseCaseException(
        'Ошибка при получении городов отправки: $e',
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
