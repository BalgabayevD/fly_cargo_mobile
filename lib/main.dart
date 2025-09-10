import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/app_router.dart';
import 'package:fly_cargo/providers/authorization-repository.dart';
import 'package:fly_cargo/providers/network-repository.dart';

void main() {
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
    return MaterialApp.router(
      title: 'Fly Cargo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
