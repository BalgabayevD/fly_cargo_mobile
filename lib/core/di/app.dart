import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/live/presentation/bloc/live_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/bloc/payment_cards_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@injectable
class App {
  final Configuration configuration;
  final Requestable requestable;

  App({
    required this.configuration,
    required this.requestable,
  });

  void startCaptured(Widget child) {
    SentryFlutter.init(
      (options) {
        options.dsn = configuration.environmentVariables.sentryDsn;
        options.sendDefaultPii = true;
      },
      appRunner: () => start(child),
    );
  }

  void start(Widget child) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LiveBloc>(
            lazy: false,
            create: (context) {
              return getIt<LiveBloc>()..add(LiveStartEvent());
            },
          ),
          BlocProvider<AuthorizationBloc>(
            create: (_) =>
                getIt<AuthorizationBloc>()..add(AuthorizationGetSessionEvent()),
          ),
          BlocProvider<LocaleCubit>(create: (_) => getIt<LocaleCubit>()),
          BlocProvider<PaymentCardsBloc>(
            create: (_) => getIt<PaymentCardsBloc>(),
          ),
        ],
        child: child,
      ),
    );
  }

  void startDynamic(Widget child) {
    if (kDebugMode) {
      start(child);
    } else {
      startCaptured(child);
    }
  }
}
