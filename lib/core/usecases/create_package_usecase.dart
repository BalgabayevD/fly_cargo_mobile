import 'package:fly_cargo/core/entities/package_entity.dart';
import 'package:fly_cargo/core/repositories/package_repository.dart';

class CreatePackageUseCase {
  final PackageRepository _repository;

  const CreatePackageUseCase(this._repository);


  Future<PackageEntity> call(PackageEntity package) async {
    return await _repository.createPackage(package);
  }
}
