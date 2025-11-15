import 'package:fly_cargo/core/repositories/box_repository.dart';
import 'package:fly_cargo/core/repositories/package_repository.dart';
import 'package:fly_cargo/core/usecases/create_package_usecase.dart';
import 'package:fly_cargo/core/usecases/get_box_by_type_usecase.dart';
import 'package:fly_cargo/core/usecases/get_boxes_usecase.dart';
import 'package:fly_cargo/data/datasources/box_local_datasource.dart';
import 'package:fly_cargo/data/datasources/package_local_datasource.dart';
import 'package:fly_cargo/data/repositories/box_repository_impl.dart';
import 'package:fly_cargo/data/repositories/package_repository_impl.dart';
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();
  late final BoxLocalDataSource _boxLocalDataSource;
  late final PackageLocalDataSource _packageLocalDataSource;
  late final BoxRepository _boxRepository;
  late final PackageRepository _packageRepository;
  late final GetBoxesUseCase _getBoxesUseCase;
  late final GetBoxByTypeUseCase _getBoxByTypeUseCase;
  late final CreatePackageUseCase _createPackageUseCase;
  void init() {
    _initDataSources();
    _initRepositories();
    _initUseCases();
  }
  void _initDataSources() {
    _boxLocalDataSource = BoxLocalDataSourceImpl();
    _packageLocalDataSource = PackageLocalDataSourceImpl();
  }
  void _initRepositories() {
    _boxRepository = BoxRepositoryImpl(_boxLocalDataSource);
    _packageRepository = PackageRepositoryImpl(_packageLocalDataSource);
  }
  void _initUseCases() {
    _getBoxesUseCase = GetBoxesUseCase(_boxRepository);
    _getBoxByTypeUseCase = GetBoxByTypeUseCase(_boxRepository);
    _createPackageUseCase = CreatePackageUseCase(_packageRepository);
  }
  GetBoxesUseCase get getBoxesUseCase => _getBoxesUseCase;
  GetBoxByTypeUseCase get getBoxByTypeUseCase => _getBoxByTypeUseCase;
  CreatePackageUseCase get createPackageUseCase => _createPackageUseCase;
  BoxRepository get boxRepository => _boxRepository;
  PackageRepository get packageRepository => _packageRepository;
}
