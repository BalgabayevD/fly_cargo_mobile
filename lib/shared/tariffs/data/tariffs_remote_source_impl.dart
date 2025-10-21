import 'package:dio/dio.dart';
import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class TariffsRemoteSourceImpl {
  final Dio _dio;

  TariffsRemoteSourceImpl(@Named('public-dio') this._dio);

  TariffsRemoteSource get instance => TariffsRemoteSource(_dio);
}
