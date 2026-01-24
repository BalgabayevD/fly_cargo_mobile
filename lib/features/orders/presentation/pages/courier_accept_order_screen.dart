import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_accept_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_open_orders_screen.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_accept_order/accept_order_button.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CourierAcceptOrdersPage extends StatelessWidget {
  static const String path = '/courier/orders/accept/:orderId';

  static String location(int orderId) =>
      Uri(path: path.replaceFirst(':orderId', orderId.toString())).toString();

  const CourierAcceptOrdersPage({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final orderId = state.pathParameters['orderId'];

        if (orderId == null || orderId.isEmpty) {
          return CourierOpenOrdersScreen.location();
        }

        if (int.tryParse(orderId) == null) {
          return CourierOpenOrdersScreen.location();
        }

        return null;
      },
      builder: (BuildContext context, state) {
        final orderId = int.parse(state.pathParameters['orderId']!);

        return BlocProvider<CourierAcceptOrderBloc>(
          create: (_) =>
              getIt<CourierAcceptOrderBloc>()
                ..add(CourierAcceptOrderLoadEvent(orderId)),
          child: CourierAcceptOrdersPage(),
        );
      },
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierAcceptOrderBloc, CourierAcceptOrderState>(
      builder: (BuildContext context, CourierAcceptOrderState state) {
        if (state is CourierAcceptOrderLoadingState) {
          return BePage(
            title: 'Заказ ${state.orderId}',
            backgroundColor: BeColors.white,
            centerTitle: true,
            isBorder: true,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CourierAcceptOrderLoadedState) {
          final created = DateTime.parse(state.order.createdAt);

          return BePage(
            title: 'Заказ ${state.order.id}',
            backgroundColor: BeColors.white,
            centerTitle: true,
            isBorder: true,
            actions: Column(
              children: [
                AcceptOrderButton(orderId: state.order.id),
                BeSpace(size: .xl),
                BeButton(
                  text: 'Открыть в 2Gis',
                  color: .gray,
                  onPressed: () async {
                    final url = Uri.parse(
                      'dgis://2gis.kz/astana/geo/70030076838427447/71.401056%2C51.12875',
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),
              ],
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<CourierAcceptOrderBloc>().add(
                  CourierAcceptOrderLoadEvent(state.order.id),
                );
                await Future.delayed(Duration(seconds: 1));
              },
              child: ListView(
                children: [
                  BeSpace(size: .md),

                  FlatListTile(
                    label: 'Создан',
                    value: DateFormat(
                      'dd MMMM yyyy, HH:mm',
                      'ru_RU',
                    ).format(created),
                  ),
                  BeSpace(size: .xxl),
                  FlatListTile(
                    label: 'Откуда',
                    value:
                        '${state.order.fromCity?.name ?? ''}, ${state.order.fromAddress}',
                  ),
                  BeSpace(size: .xxl),
                  FlatListTile(
                    label: 'Вес',
                    value: state.order.weight.toString(),
                  ),
                  BeSpace(size: .xxl),
                  FlatListTile(
                    label: 'Тариф',
                    value: state.order.tariff?.name ?? '',
                  ),
                ],
              ),
            ),
          );
        }

        return const BeNothing();
      },
    );
  }
}
