import 'package:flutter/material.dart';
import 'package:fly_cargo/core/di/app.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/app/app.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:yandex_maps_mapkit_lite/init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  // await initMapkit(apiKey: getIt<EnvironmentVariables>().yandexMapKey);

  await initializeDateFormatting('ru', null);

  getIt<App>().start(SapsanoApp());
}
