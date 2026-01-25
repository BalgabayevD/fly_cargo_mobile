import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_orders_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CourierOrdersPage extends StatelessWidget {
  static const String path = '/courier/orders';

  static String location() => Uri(path: path).toString();

  const CourierOrdersPage({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const CourierOrdersPage(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourierOrdersBloc>(
      create: (_) =>
          getIt<CourierOrdersBloc>()..add(CourierOrdersLoadAllEvent()),
      child: BePage(
        title: 'Доставки',
        backgroundColor: BeColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        isBorder: true,
        child: BlocBuilder<CourierOrdersBloc, CourierOrdersState>(
          builder: (BuildContext context, CourierOrdersState state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CourierOrdersBloc>().add(
                  CourierOrdersLoadAllEvent(),
                );
                await Future.delayed(const Duration(seconds: 1));
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

                        String message = 'Без трекового номера';
                        String statusLabel = '';

                        if (order.identifications.isNotEmpty) {
                          final identification = order.identifications.first;
                          if (identification.uuid != null) {
                            message = 'Трековый номер ${identification.uuid}';
                          }
                        }

                        if (['created'].contains(order.status)) {
                          color = .warning;
                          statusLabel = 'Необходимо принять';
                        }
                        if (['accepted'].contains(order.status)) {
                          color = .success;
                          statusLabel = 'Увезти на склад';
                        }

                        if (['checked'].contains(order.status)) {
                          color = .success;
                          statusLabel = 'Выполнен';
                        }

                        if (['completed'].contains(order.status)) {
                          color = .success;
                          statusLabel = 'Доставлен';
                        }

                        if (['canceled'].contains(order.status)) {
                          color = .danger;
                          statusLabel = 'Оплочен';
                        }

                        return OrderListTile(
                          onTap: () {},
                          title: 'Заказ ${order.id}',
                          trailing: DateFormat(
                            'dd MMM yyyy',
                            'ru_RU',
                          ).format(created),
                          message: message,
                          statusLabel:
                              '$statusLabel${order.isPaid ? '' : ', не оплочен'}',
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
