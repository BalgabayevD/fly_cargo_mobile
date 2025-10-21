import 'package:fly_cargo/shared/tariffs/config/tariffs_module.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  TariffsModule.configure(getIt);
}
