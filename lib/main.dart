import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/core/flutter_better_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/theme.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/main_scaffold_page.dart';
import 'package:fly_cargo/features/onboarding/onboarding_video.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/auth/presentation/router/auth_router.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/shared/profile/presentation/bloc/profile_bloc.dart';
import 'package:fly_cargo/shared/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yandex_maps_mapkit_lite/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMapkit(apiKey: '58894ad5-9031-4696-9c4e-4d62ebd8e3cc');
  ServiceLocator().init();
  await configureDependencies();
  await FlutterBetterAuth.initialize(url: 'https://authfc.maguya.kz/api/auth');

  final prefs = await SharedPreferences.getInstance();

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
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<TariffsBloc>(create: (_) => getIt<TariffsBloc>()),
        BlocProvider<PriceCalculationBloc>(
          create: (_) => getIt<PriceCalculationBloc>(),
        ),
        BlocProvider<TariffSelectionBloc>(
          create: (_) => getIt<TariffSelectionBloc>(),
        ),
        BlocProvider<ProfileBloc>(create: (_) => getIt<ProfileBloc>()),
        BlocProvider<OrdersBloc>(create: (_) => getIt<OrdersBloc>()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthBloc>().add(const AuthInitialized());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sapsano',
      theme: AppTheme.lightTheme,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial || state is AuthUnauthenticated) {
            return const OnboardingScreen();
          }
          if (state is AuthAuthenticated) {
            return const MainScaffoldPage();
          }
          if (state is AuthLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const OnboardingScreen();
        },
      ),
      onGenerateRoute: AuthRouter.generateRoute,
    );
  }
}
