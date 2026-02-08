import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/features/create_order/data/models/tariff_models.dart';
import 'package:fly_cargo/features/create_order/domain/repositories/tariffs_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: TariffsRestRepository)
class TariffsRestRepositoryImpl implements TariffsRestRepository {
  final Requestable requestable;
  final Configuration configuration;

  TariffsRestRepositoryImpl({
    required this.requestable,
    required this.configuration,
  });

  String get _ => configuration.environmentVariables.gatewayBaseUrl;

  @override
  Future<List<TariffCategoryModel>> getTariffCategories() async {
    try {
      final response = await requestable.dio.get(
        '$_/tariffs/categories',
      );

      return (response.data['data'] as List).map((data) {
        return TariffCategoryModel.fromJson(data);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}
