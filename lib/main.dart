import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/constants.dart';
import 'features/auth/data/datasources/auth_local_data_source.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/domain/usecases/register_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cargo/data/repositories/cargo_repository_impl.dart';
import 'features/cargo/domain/usecases/search_locations_usecase.dart';
import 'features/cargo/presentation/bloc/map_bloc.dart';
import 'features/cargo/presentation/pages/map_page.dart';
import 'shared/services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePageProvider(prefs: prefs),
    );
  }
}

class HomePageProvider extends StatelessWidget {
  final SharedPreferences prefs;

  const HomePageProvider({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    final networkInfo = NetworkInfoImpl();
    final storageService = StorageServiceImpl(prefs);
    final authRemoteDataSource = AuthRemoteDataSourceImpl(
      baseUrl: AppConstants.baseUrl,
    );
    final authLocalDataSource = AuthLocalDataSourceImpl(storageService);

    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
      localDataSource: authLocalDataSource,
      networkInfo: networkInfo,
    );

    final loginUseCase = LoginUseCase(authRepository);
    final registerUseCase = RegisterUseCase(authRepository);
    final logoutUseCase = LogoutUseCase(authRepository);

    final cargoRepository = CargoRepositoryImpl();
    final searchLocationsUseCase = SearchLocationsUseCase(cargoRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            loginUseCase: loginUseCase,
            registerUseCase: registerUseCase,
            logoutUseCase: logoutUseCase,
          ),
        ),
        BlocProvider<MapBloc>(
          create: (context) =>
              MapBloc(searchLocationsUseCase: searchLocationsUseCase),
        ),
      ],
      child: const MapPage(),
    );
  }
}
