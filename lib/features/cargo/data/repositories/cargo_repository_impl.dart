import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/cargo.dart';
import '../../domain/entities/location.dart';
import '../../domain/repositories/cargo_repository.dart';

class CargoRepositoryImpl implements CargoRepository {
  @override
  Future<Either<Failure, List<Cargo>>> getAllCargo() async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([]);
  }

  @override
  Future<Either<Failure, Cargo>> getCargoById(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Left(const ServerFailure('Not implemented'));
  }

  @override
  Future<Either<Failure, Cargo>> createCargo(Cargo cargo) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(cargo);
  }

  @override
  Future<Either<Failure, Cargo>> updateCargo(Cargo cargo) async {
    await Future.delayed(const Duration(seconds: 1));
    return Right(cargo);
  }

  @override
  Future<Either<Failure, void>> deleteCargo(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<Cargo>>> getCargoByUserId(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Right([]);
  }

  @override
  Future<Either<Failure, List<Location>>> searchLocations(String query) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (query.isEmpty) {
      return const Right([]);
    }

    final demoLocations = [
      const Location(
        latitude: 43.238949,
        longitude: 76.889709,
        name: 'Аэропорт Алматы',
        address: 'Алматы, ул. Аэропорт',
      ),
      const Location(
        latitude: 43.2220,
        longitude: 76.8512,
        name: 'ТРЦ Mega Center',
        address: 'Алматы, ул. Розыбакиева, 247',
      ),
      const Location(
        latitude: 43.2350,
        longitude: 76.9150,
        name: 'ТРЦ Dostyk Plaza',
        address: 'Алматы, ул. Достык, 104',
      ),
      const Location(
        latitude: 43.2500,
        longitude: 76.9500,
        name: 'ТРЦ Esentai Mall',
        address: 'Алматы, ул. Аль-Фараби, 77/8',
      ),
      const Location(
        latitude: 43.2000,
        longitude: 76.9000,
        name: 'ТРЦ Galleria',
        address: 'Алматы, ул. Достык, 104',
      ),
    ];

    final filteredLocations = demoLocations.where((location) {
      final searchQuery = query.toLowerCase();
      return location.name?.toLowerCase().contains(searchQuery) == true ||
          location.address?.toLowerCase().contains(searchQuery) == true;
    }).toList();

    return Right(filteredLocations);
  }
}
