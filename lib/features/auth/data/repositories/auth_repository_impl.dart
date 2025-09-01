import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.login(email, password);
        await localDataSource.cacheUser(userModel);
        await localDataSource.cacheToken('dummy_token');
        return Right(userModel);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on AuthException catch (e) {
        return Left(AuthFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('Нет подключения к интернету'));
    }
  }

  @override
  Future<Either<Failure, User>> register(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final userModel = await remoteDataSource.register(
          email,
          password,
          name,
          phone,
        );
        await localDataSource.cacheUser(userModel);
        await localDataSource.cacheToken('dummy_token');
        return Right(userModel);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      } on ValidationException catch (e) {
        return Left(ValidationFailure(e.message));
      }
    } else {
      return const Left(NetworkFailure('Нет подключения к интернету'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearCache();
      await remoteDataSource.logout();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedIn() async {
    try {
      final token = await localDataSource.getCachedToken();
      return Right(token != null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
