import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:go_router/go_router.dart';

class CourierHomeScreen extends StatelessWidget {
  static const String path = '/courier';

  static String location() => Uri(path: path).toString();

  const CourierHomeScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CourierHomeScreen(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Главная',
      automaticallyImplyLeading: false,
      centerTitle: true,
      isBorder: true,
      backgroundColor: BeColors.white,
      child: ListView(
        children: [
          BeSpace(size: .xl),
          BeButton(
            text: 'Принять заказ клиента',
            color: .gray,
            variant: .solid,
          ),
          BeSpace(size: .xl),
          BeButton(
            text: 'Принять прибывшие заказы',
            color: .gray,
            variant: .solid,
          ),
        ],
      ),
    );
  }
}
