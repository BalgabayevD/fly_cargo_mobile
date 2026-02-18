import 'package:fly_cargo/features/auth/data/mappers/user_session_mapper.dart';
import 'package:fly_cargo/features/auth/data/sources/local/auth_local_data_source.dart';
import 'package:fly_cargo/features/auth/data/sources/remote/auth_remote_data_source.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_session_entity.dart';
import 'package:fly_cargo/features/auth/domain/repositories/authorization_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthorizationRepository)
class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthLocalDataSource _localDataSource;
  final AuthRemoteDataSource _remoteDataSource;

  const AuthorizationRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
  );

  @override
  Future<UserSessionInfoEntity?> getCachedSession() async {
    try {
      final model = await _localDataSource.getCachedSession();
      if (model == null) return null;

      return UserSessionInfoMapper.toEntity(model);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<UserSessionInfoEntity?> getRemoteSession() async {
    try {
      final model = await _remoteDataSource.getSession();

      if (model == null) {
        return null;
      }

      final entity = UserSessionInfoMapper.toEntity(model);

      return entity;
    } catch (e, stackTrace) {
      return null;
    }
  }

  @override
  Future<void> saveSession(UserSessionInfoEntity session) async {
    try {
      final model = UserSessionInfoMapper.toModel(session);
      await _localDataSource.cacheSession(model);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> clearSession() async {
    try {
      await _localDataSource.clearSession();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> requestOTP(String phoneNumber) async {
    return _remoteDataSource.requestOTP(phoneNumber);
  }

  @override
  Future<String?> confirmOTP(String phoneNumber, String code) async {
    return _remoteDataSource.confirmOTP(phoneNumber, code);
  }

  @override
  Future<bool> updateProfile(String name) async {
    return _remoteDataSource.updateProfile(name);
  }

  @override
  Future<void> signOut() async {
    return _remoteDataSource.signOut();
  }
}
