import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:retrofit/retrofit.dart';

part 'tariffs_remote_source.g.dart';

@RestApi()
abstract class TariffsRemoteSource {
  factory TariffsRemoteSource(Dio dio, {String baseUrl}) = _TariffsRemoteSource;

  @GET('/api/v1/tariffs/categories')
  Future<List<TariffCategoryModel>> getTariffCategories();
}
