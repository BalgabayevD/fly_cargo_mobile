import 'package:fly_cargo/core/entities/package_entity.dart';

abstract class PackageRepository {
  /// Создать новую посылку
  Future<PackageEntity> createPackage(PackageEntity package);

  /// Обновить посылку
  Future<PackageEntity> updatePackage(PackageEntity package);

  /// Получить посылку по ID
  Future<PackageEntity?> getPackageById(String id);

  /// Получить все посылки пользователя
  Future<List<PackageEntity>> getUserPackages();

  /// Удалить посылку
  Future<void> deletePackage(String id);
}
