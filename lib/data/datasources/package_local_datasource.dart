import 'package:fly_cargo/core/entities/package_entity.dart';

abstract class PackageLocalDataSource {
  /// Сохранить посылку локально
  Future<void> savePackage(PackageEntity package);

  /// Получить посылку по ID
  Future<PackageEntity?> getPackageById(String id);

  /// Получить все посылки
  Future<List<PackageEntity>> getAllPackages();

  /// Удалить посылку
  Future<void> deletePackage(String id);
}

class PackageLocalDataSourceImpl implements PackageLocalDataSource {
  final Map<String, PackageEntity> _packages = {};

  @override
  Future<void> savePackage(PackageEntity package) async {
    _packages[package.id] = package;
  }

  @override
  Future<PackageEntity?> getPackageById(String id) async {
    return _packages[id];
  }

  @override
  Future<List<PackageEntity>> getAllPackages() async {
    return _packages.values.toList();
  }

  @override
  Future<void> deletePackage(String id) async {
    _packages.remove(id);
  }
}
