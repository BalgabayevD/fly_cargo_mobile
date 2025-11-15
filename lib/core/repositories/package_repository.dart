import 'package:fly_cargo/core/entities/package_entity.dart';
abstract class PackageRepository {
  Future<PackageEntity> createPackage(PackageEntity package);
  Future<PackageEntity> updatePackage(PackageEntity package);
  Future<PackageEntity?> getPackageById(String id);
  Future<List<PackageEntity>> getUserPackages();
  Future<void> deletePackage(String id);
}
