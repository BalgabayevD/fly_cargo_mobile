import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/configuration.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/requestable.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/authorization_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class App {
  final Configuration configuration;
  final Requestable requestable;

  App({
    required this.configuration,
    required this.requestable,
  });

  start(Widget child) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthorizationBloc>(
            create: (_) =>
                getIt<AuthorizationBloc>()..add(AuthorizationGetSessionEvent()),
          ),
          BlocProvider<LocaleCubit>(create: (_) => getIt<LocaleCubit>()),
          BlocProvider<OrdersListBloc>(create: (_) => getIt<OrdersListBloc>()),
        ],
        child: child,
      ),
    );
  }
}
