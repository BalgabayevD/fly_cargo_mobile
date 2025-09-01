import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/location.dart';
import '../repositories/cargo_repository.dart';

class SearchLocationsUseCase
    implements UseCase<List<Location>, SearchLocationsParams> {
  final CargoRepository repository;

  SearchLocationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Location>>> call(
    SearchLocationsParams params,
  ) async {
    return await repository.searchLocations(params.query);
  }
}

class SearchLocationsParams extends Equatable {
  final String query;

  const SearchLocationsParams({required this.query});

  @override
  List<Object> get props => [query];
}
