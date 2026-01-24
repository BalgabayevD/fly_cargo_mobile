import 'package:fly_cargo/features/destination/domain/entities/address_entity.dart';
import 'package:fly_cargo/features/destination/domain/repositories/destination_repository.dart';

class SearchAddressesUseCase {
  final DestinationRepository _destinationRepository;

  SearchAddressesUseCase(this._destinationRepository);

  Future<List<AddressEntity>> call({
    required String city,
    required String address,
  }) async {
    if (city.isEmpty) {
      throw ArgumentError('Название города не может быть пустым');
    }
    if (address.isEmpty) {
      throw ArgumentError('Адрес для поиска не может быть пустым');
    }
    if (address.length < 2) {
      throw ArgumentError(
        'Поисковый запрос должен содержать минимум 2 символа',
      );
    }
    try {
      return await _destinationRepository.searchAddresses(
        city: city,
        address: address,
      );
    } catch (e) {
      throw DestinationUseCaseException('Ошибка при поиске адресов: $e');
    }
  }
}

class DestinationUseCaseException implements Exception {
  final String message;
  const DestinationUseCaseException(this.message);

  @override
  String toString() => 'DestinationUseCaseException: $message';
}
