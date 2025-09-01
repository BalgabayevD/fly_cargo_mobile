import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cargo.dart';
import '../entities/location.dart';

abstract class CargoRepository {
  Future<Either<Failure, List<Cargo>>> getAllCargo();
  Future<Either<Failure, Cargo>> getCargoById(String id);
  Future<Either<Failure, Cargo>> createCargo(Cargo cargo);
  Future<Either<Failure, Cargo>> updateCargo(Cargo cargo);
  Future<Either<Failure, void>> deleteCargo(String id);
  Future<Either<Failure, List<Cargo>>> getCargoByUserId(String userId);
  Future<Either<Failure, List<Location>>> searchLocations(String query);
}
