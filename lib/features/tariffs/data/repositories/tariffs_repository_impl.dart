import 'package:fly_cargo/features/tariffs/data/mappers/tariff_mapper.dart';
import 'package:fly_cargo/features/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/features/tariffs/data/tariffs_remote_source_impl.dart';
import 'package:fly_cargo/features/tariffs/domain/entities/tariff_entity.dart';
import 'package:fly_cargo/features/tariffs/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TariffsRepository)
class TariffsRepositoryImpl implements TariffsRepository {
  final TariffsRemoteSourceImpl _remoteSourceImpl;

  TariffsRepositoryImpl(this._remoteSourceImpl);

  @override
  Future<List<TariffCategoryEntity>> getTariffCategories() async {
    try {
      final response = await _remoteSourceImpl.instance.getTariffCategories();
      return response.data.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw TariffsRepositoryException(
        'Ошибка получения категорий тарифов: $e',
      );
    }
  }

  @override
  Future<CreateTariffResultEntity> createTariff(CreateTariffRequest request) async {
    try {
      final response = await _remoteSourceImpl.instance.createTariff(request);
      return response.toEntity();
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
