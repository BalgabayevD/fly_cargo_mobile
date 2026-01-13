import 'package:fly_cargo/core/di/environment_variables.dart';
import 'package:fly_cargo/core/di/package.dart';
import 'package:injectable/injectable.dart';

@injectable
class Configuration {
  final Package package;
  // final LogLevel logLevel;
  final EnvironmentVariables environmentVariables;

  const Configuration({
    required this.package,
    required this.environmentVariables,
    // this.logLevel = LogLevel.error,
  });

  bool get isShowOnboarding {
    return package.sharedPreferences.getBool('isShowOnboarding') ?? true;
  }

  void setShowOnboarding(bool value) {
    package.sharedPreferences.setBool('isShowOnboarding', value);
  }

  bool get isAuthenticated {
    return package.sharedPreferences.getBool('isAuthenticated') ?? false;
  }

  void setIsAuthenticated(bool value) {
    package.sharedPreferences.setBool('isAuthenticated', value);
  }
}
