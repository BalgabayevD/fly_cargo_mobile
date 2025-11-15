import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_better_auth/core/flutter_better_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/router/auth_router.dart';
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
  FlutterBetterAuth.dioClient.interceptors.add(
    InterceptorsWrapper(
      onResponse: (res, handler) async {
        final authToken = res.headers.map['set-auth-token'];
        await SharedPreferences.getInstance().then((store) {
          if (authToken != null && authToken.isNotEmpty) {
            store.setString('auth-token', authToken.first);
          }
        });
        handler.next(res);
      },
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<TariffsBloc>(create: (_) => getIt<TariffsBloc>()),
        BlocProvider<TariffSelectionBloc>(
          create: (_) => getIt<TariffSelectionBloc>(),
        ),
        BlocProvider<ProfileBloc>(create: (_) => getIt<ProfileBloc>()),
      ],
      child: const App(),
    ),
  );
}
class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fly Cargo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
      onGenerateRoute: AuthRouter.generateRoute,
    );
  }
}
