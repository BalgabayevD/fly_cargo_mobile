import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source_impl.dart';
import 'package:fly_cargo/shared/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TariffsRepository)
class TariffsRepositoryImpl implements TariffsRepository {
  final TariffsRemoteSourceImpl _remoteSourceImpl;

  TariffsRepositoryImpl(this._remoteSourceImpl);

  @override
  Future<List<TariffCategoryModel>> getTariffCategories() async {
    try {
      final response = await _remoteSourceImpl.instance.getTariffCategories();
      return response.data;
    } catch (e) {
      throw TariffsRepositoryException(
        'Ошибка получения категорий тарифов: $e',
      );
    }
  }

  @override
  Future<CreateTariffResponse> createTariff(CreateTariffRequest request) async {
    try {
      return await _remoteSourceImpl.instance.createTariff(request);
    } catch (e) {
      throw TariffsRepositoryException(
        'Ошибка создания тарифа: $e',
      );
    }
  }
}

class TariffsRepositoryException implements Exception {
  final String message;

  const TariffsRepositoryException(this.message);

  @override
  String toString() => 'TariffsRepositoryException: $message';
}
