import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/destination/presentation/pages/choose_address_page.dart';
import 'package:fly_cargo/shared/destination/presentation/pages/choose_city_page.dart';

class DestinationRouter {
  static const String chooseCity = '/destination/choose-city';
  static const String chooseAddress = '/destination/choose-address';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chooseCity:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ChooseCityPage(
            cityType: args?['cityType'] ?? CityType.from,
            fromCityId: args?['fromCityId'],
          ),
        );

      case chooseAddress:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ChooseAddressPage(city: args?['city'] ?? ''),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Страница не найдена'))),
        );
    }
  }

  /// Навигация к странице выбора города
  static Future<T?> navigateToChooseCity<T>({
    required BuildContext context,
    required CityType cityType,
    String? fromCityId,
  }) {
    return Navigator.pushNamed<T>(
      context,
      chooseCity,
      arguments: {'cityType': cityType, 'fromCityId': fromCityId},
    );
  }

  /// Навигация к странице выбора адреса
  static Future<T?> navigateToChooseAddress<T>({
    required BuildContext context,
    required String city,
  }) {
    return Navigator.pushNamed<T>(
      context,
      chooseAddress,
      arguments: {'city': city},
    );
  }
}
