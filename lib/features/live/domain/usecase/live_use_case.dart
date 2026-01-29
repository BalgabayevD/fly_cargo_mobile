import 'package:fly_cargo/features/live/domain/repositories/live_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class LiveUseCase {
  final LiveRepository live;

  const LiveUseCase(this.live);

  Future<bool> logLive() async {
    try {
      return await live.logLive();
    } catch (e) {
      return false;
    }
  }
}
