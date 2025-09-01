import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/cargo.dart';
import '../repositories/cargo_repository.dart';

class GetAllCargoUseCase implements UseCase<List<Cargo>, NoParams> {
  final CargoRepository repository;

  GetAllCargoUseCase(this.repository);

  @override
  Future<Either<Failure, List<Cargo>>> call(NoParams params) async {
    return await repository.getAllCargo();
  }
}
