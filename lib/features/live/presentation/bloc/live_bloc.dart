import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/live/domain/usecase/live_use_case.dart';
import 'package:injectable/injectable.dart';

part 'live_event.dart';
part 'live_state.dart';

@injectable
class LiveBloc extends Bloc<LiveEvent, LiveState> {
  static final int duration = 60 * 5;

  final LiveUseCase live;

  StreamSubscription<int>? _tickerSubscription;

  LiveBloc(this.live) : super(LiveInitialState()) {
    on<LiveStartEvent>((event, emit) {
      _tickerSubscription?.cancel();

      final tick = Stream.periodic(
        const Duration(minutes: 5),
        (duration) => duration,
      );

      _tickerSubscription = tick.listen((duration) {
        live.focus();
      });
    });
  }
}
