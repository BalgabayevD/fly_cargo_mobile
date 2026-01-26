import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/haptic.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_open_orders_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_accept_order_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
    return BlocProvider<CourierOpenOrdersBloc>(
      lazy: false,
      create: (_) =>
          getIt<CourierOpenOrdersBloc>()..add(CourierOpenOrdersLoadAllEvent()),
      child: BePage(
        title: 'Заказы',
        automaticallyImplyLeading: false,
        centerTitle: true,
        isBorder: true,
        backgroundColor: BeColors.white,
        child: BlocBuilder<CourierOpenOrdersBloc, CourierOpenOrdersState>(
          builder: (BuildContext context, CourierOpenOrdersState state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CourierOpenOrdersBloc>().add(
                  CourierOpenOrdersLoadAllEvent(),
                );
                await BeHaptic.onRefresh();
              },
              child: ListView(
                children: [
                  BeSpace(size: .xl),
                  if (state.isLoading)
                    BeChip(
                      text: 'Загрузка',
                      isLoading: true,
                      color: .gray,
                    ),
                  if (state.orders.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        final order = state.orders[index];
                        final created = DateTime.parse(order.createdAt);

                        OrderListTileColor color = .warning;

                        return OrderListTile(
                          onTap: () {
                            context.push(
                              CourierAcceptOrdersPage.location(order.id),
                            );
                          },
                          title: 'Заказ ${order.id}',
                          trailing: DateFormat(
                            'dd MMM yyyy',
                            'ru_RU',
                          ).format(created),
                          message:
                              '${order.fromCity?.name}, ${order.fromAddress}',
                          statusLabel:
                              'Свободный${order.isPaid ? '' : ', не оплочен'}',
                          color: color,
                          varinant: order.isPaid ? .flat : .bordered,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return BeSpace(size: .xl);
                      },
                      itemCount: state.orders.length,
                    ),

                  BeSpace(size: .xl),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
