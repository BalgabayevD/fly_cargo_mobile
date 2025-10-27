import 'package:fly_cargo/shared/tariffs/data/tariffs_remote_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class TariffsRemoteSourceImpl {
  final TariffsRemoteSource _remoteSource;

  TariffsRemoteSourceImpl(this._remoteSource);

  TariffsRemoteSource get instance => _remoteSource;
}
