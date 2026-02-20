import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityCubit extends Cubit<bool> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityCubit() : super(true) {
    _init();
  }

  Future<void> _init() async {
    final results = await Connectivity().checkConnectivity();
    emit(!results.contains(ConnectivityResult.none));

    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      emit(!results.contains(ConnectivityResult.none));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
