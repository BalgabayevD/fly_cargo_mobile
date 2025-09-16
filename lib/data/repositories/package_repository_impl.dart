import 'package:fly_cargo/core/entities/package_entity.dart';
import 'package:fly_cargo/core/repositories/package_repository.dart';
import 'package:fly_cargo/data/datasources/package_local_datasource.dart';

class PackageRepositoryImpl implements PackageRepository {
  final PackageLocalDataSource _localDataSource;

  const PackageRepositoryImpl(this._localDataSource);

  @override
  Future<PackageEntity> createPackage(PackageEntity package) async {
    await _localDataSource.savePackage(package);
    return package;
  }

  @override
  Future<PackageEntity> updatePackage(PackageEntity package) async {
    await _localDataSource.savePackage(package);
    return package;
  }

  @override
  Future<PackageEntity?> getPackageById(String id) async {
    return await _localDataSource.getPackageById(id);
  }

  @override
  Future<List<PackageEntity>> getUserPackages() async {
    return await _localDataSource.getAllPackages();
  }

  @override
  Future<void> deletePackage(String id) async {
    await _localDataSource.deletePackage(id);
  }
}
