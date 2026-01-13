// @Injectable(as: TariffsRepository)
// class TariffsRepositoryImpl implements TariffsRepository {
//   // final TariffsRemoteSourceImpl _remoteSourceImpl;
//
//   TariffsRepositoryImpl();
//   // TariffsRepositoryImpl(this._remoteSourceImpl);
//
//   @override
//   Future<List<TariffCategoryEntity>> getTariffCategories() async {
//     try {
//       throw UnimplementedError();
//       // final response = await _remoteSourceImpl.instance.getTariffCategories();
//       // return response.data.map((model) => model.toEntity()).toList();
//     } catch (e) {
//       throw TariffsRepositoryException(
//         'Ошибка получения категорий тарифов: $e',
//       );
//     }
//   }
//
//   @override
//   Future<CreateTariffResultEntity> createTariff(
//     CreateTariffRequest request,
//   ) async {
//     try {
//       throw UnimplementedError();
//       // final response = await _remoteSourceImpl.instance.createTariff(request);
//       // return response.toEntity();
//     } catch (e) {
//       throw TariffsRepositoryException(
//         'Ошибка создания тарифа: $e',
//       );
//     }
//   }
// }

class TariffsRepositoryException implements Exception {
  final String message;
  const TariffsRepositoryException(this.message);
  @override
  String toString() => 'TariffsRepositoryException: $message';
}
