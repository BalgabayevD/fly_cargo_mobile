import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/domain/repositories/destination_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCitiesFromUseCase {
  final DestinationRepository _destinationRepository;
  GetCitiesFromUseCase(this._destinationRepository);
  Future<List<CityModel>> call() async {
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
