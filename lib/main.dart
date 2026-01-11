import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/core/flutter_better_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/l10n/locale_cubit.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_event.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_order_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/price_calculation_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:fly_cargo/features/tariff/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/tariffs/presentation/bloc/tariffs_bloc.dart';
import 'package:fly_cargo/shared/ui/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
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

  final storedToken = prefs.getString('auth-token');
  final hasToken = storedToken != null && storedToken.isNotEmpty;

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
        BlocProvider<LocaleCubit>(create: (_) => getIt<LocaleCubit>()),
        BlocProvider<TariffsBloc>(create: (_) => getIt<TariffsBloc>()),
        BlocProvider<PriceCalculationBloc>(
          create: (_) => getIt<PriceCalculationBloc>(),
        ),
        BlocProvider<TariffSelectionBloc>(
          create: (_) => getIt<TariffSelectionBloc>(),
        ),
        BlocProvider<CreateOrderBloc>(create: (_) => getIt<CreateOrderBloc>()),
        BlocProvider<OrdersListBloc>(create: (_) => getIt<OrdersListBloc>()),
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
    return BlocBuilder<LocaleCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          title: 'Sapsano',
          theme: ThemeData(
            useMaterial3: true,
            buttonTheme: ButtonThemeData(buttonColor: BeColors.primary),
            primaryColor: BeColors.primary,
            colorScheme: ColorScheme.of(
              context,
            ).copyWith(primary: BeColors.primary),
            scaffoldBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: BeColors.primary),
              ),
            ),
            textTheme: GoogleFonts.montserratTextTheme(
              TextTheme.of(context),
            ),
            appBarTheme: AppBarTheme(
              centerTitle: true,
              titleTextStyle: GoogleFonts.montserrat(
                fontWeight: .w600,
                fontSize: 17,
                color: BeColors.surface5,
              ),
              backgroundColor: BeColors.white,
            ),
          ),
          routerConfig: _router,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.supportedLocales,
          locale: locale,
        );
      },
    );
  }
}
