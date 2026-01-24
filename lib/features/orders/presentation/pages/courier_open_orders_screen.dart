import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:go_router/go_router.dart';

class CourierOpenOrdersScreen extends StatelessWidget {
  static const String path = '/courier/orders/open';

  static String location() => Uri(path: path).toString();

  const CourierOpenOrdersScreen({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CourierOpenOrdersScreen(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      title: 'Заказаы',
      automaticallyImplyLeading: false,
      centerTitle: true,
      isBorder: true,
      backgroundColor: BeColors.white,
      child: ListView(
        children: [
          Text('Страница в разработке'),
        ],
      ),
    );
  }
}
