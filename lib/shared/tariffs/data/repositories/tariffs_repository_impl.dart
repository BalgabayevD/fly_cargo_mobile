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
      return await _remoteSourceImpl.instance.getTariffCategories();
    } catch (e) {
      throw TariffsRepositoryException(
        'Ошибка получения категорий тарифов: $e',
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
