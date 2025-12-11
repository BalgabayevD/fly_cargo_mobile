import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/destination/presentation/pages/choose_address_page.dart';

class DestinationRouter {
  static const String chooseAddress = '/destination/choose-address';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
