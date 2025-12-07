import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/core/flutter_better_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/theme.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/shared/auth/domain/usecases/auth_status_usecase.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_maps_mapkit_lite/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('ru', null);

  await initMapkit(apiKey: '58894ad5-9031-4696-9c4e-4d62ebd8e3cc');
  await configureDependencies();
  await FlutterBetterAuth.initialize(url: 'https://authfc.maguya.kz/api/auth');

  final prefs = await SharedPreferences.getInstance();
  final authStatusUseCase = getIt<AuthStatusUseCase>();
  final hasToken = await authStatusUseCase.isAuthenticated();

  final authBloc = getIt<AuthBloc>();

  FlutterBetterAuth.dioClient.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final currentToken = prefs.getString('auth-token');
        if (currentToken != null && currentToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $currentToken';
        }
        handler.next(options);
      },
      onResponse: (res, handler) async {
        final authToken = res.headers.map['set-auth-token'];
        if (authToken != null && authToken.isNotEmpty) {
          await prefs.setString('auth-token', authToken.first);
        }
        handler.next(res);
      },
    ),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => authBloc),
        BlocProvider<TariffsBloc>(create: (_) => getIt<TariffsBloc>()),
        BlocProvider<PriceCalculationBloc>(
          create: (_) => getIt<PriceCalculationBloc>(),
        ),
        BlocProvider<TariffSelectionBloc>(
          create: (_) => getIt<TariffSelectionBloc>(),
        ),
        BlocProvider<OrdersBloc>(create: (_) => getIt<OrdersBloc>()),
      ],
      child: App(
        authBloc: authBloc,
        initialRoute: hasToken ? AppRoutes.home : AppRoutes.onboarding,
      ),
    ),
  );
}

class App extends StatefulWidget {
  final AuthBloc authBloc;
  final String initialRoute;

  const App({
    required this.authBloc,
    required this.initialRoute,
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.authBloc, widget.initialRoute);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.authBloc.add(const AuthInitialized());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sapsano',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}
