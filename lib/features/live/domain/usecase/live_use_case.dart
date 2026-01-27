import 'package:fly_cargo/features/live/domain/repositories/live_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
final class LiveUseCase {
  final LiveRepository live;

  const LiveUseCase(this.live);

  Future<bool> focus() async {
    try {
      return await live.focus();
    } catch (e) {
      return false;
    }
  }
}
