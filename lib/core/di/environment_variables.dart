import 'package:injectable/injectable.dart';

@module
abstract class EnvironmentVariablesModule {
  @preResolve
  Future<EnvironmentVariables> environmentVariables() async {
    return EnvironmentVariables.fromEnvironment();
  }
}

class EnvironmentVariables {
  String orderBaseUrl;
  String gatewayBaseUrl;
  String yandexMapKey;
  String firebaseAppCheck;

  EnvironmentVariables({
    required this.orderBaseUrl,
    required this.gatewayBaseUrl,
    required this.yandexMapKey,
    required this.firebaseAppCheck,
  }) : assert(orderBaseUrl.isNotEmpty || gatewayBaseUrl.isNotEmpty);

  factory EnvironmentVariables.fromEnvironment() {
    const orderBaseUrl = String.fromEnvironment('OrderBaseUrl');
    const gatewayBaseUrl = String.fromEnvironment('GatewayBaseUrl');
    const yandexMapKey = String.fromEnvironment('YandexMapKey');
    const firebaseAppCheck = String.fromEnvironment('FirebaseAppCheck');

    return EnvironmentVariables(
      orderBaseUrl: orderBaseUrl,
      gatewayBaseUrl: gatewayBaseUrl,
      yandexMapKey: yandexMapKey,
      firebaseAppCheck: firebaseAppCheck,
    );
  }
}
