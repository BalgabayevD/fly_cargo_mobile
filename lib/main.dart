import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/config/talker_service.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/features/app_mode_selection_page.dart';
import 'package:fly_cargo/providers/authorization-repository.dart';
import 'package:fly_cargo/providers/network-repository.dart';

void main() {
  // Инициализируем Talker при запуске приложения
  TalkerService.instance.initialize();

  // Инициализируем ServiceLocator
  ServiceLocator().init();

  runApp(
    RepositoryProvider<NetworkRepository>(
      create: (BuildContext context) => NetworkRepository(),
      child: RepositoryProvider<AuthorizationRepository>(
        create: (BuildContext context) {
          final auth = AuthorizationRepository();
          auth.provideNetwork(context.read<NetworkRepository>());
          return auth;
        },
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AppModeSelectionPage(),
    );
  }
}
