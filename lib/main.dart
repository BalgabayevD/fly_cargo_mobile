import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/core/extensions/build_context_x.dart';
import 'package:fly_cargo/core/network/talker_service.dart';
import 'package:fly_cargo/features/home/presentation/home_page.dart';
import 'package:fly_cargo/providers/authorization-repository.dart';
import 'package:fly_cargo/providers/network-repository.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализируем Talker при запуске приложения
  TalkerService.instance.initialize();

  // Инициализируем старый ServiceLocator (для совместимости)
  ServiceLocator().init();

  // Инициализируем новый DI контейнер
  await configureDependencies();

  runApp(
    RepositoryProvider<NetworkRepository>(
      create: (BuildContext context) => NetworkRepository(),
      child: RepositoryProvider<AuthorizationRepository>(
        create: (BuildContext context) {
          final auth = AuthorizationRepository();
          auth.provideNetwork(context.read<NetworkRepository>());
          return auth;
        },
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider<AuthBloc>(
        create: (_) => context.di<AuthBloc>(),
        child: const HomePage(),
      ),
      //  const AppModeSelectionPage(),
    );
  }
}
