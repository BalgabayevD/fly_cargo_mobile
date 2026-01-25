import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/client_orders_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_page.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ClientOrdersPage extends StatelessWidget {
  static const String path = '/orders';

  static String location() => Uri(path: path).toString();

  const ClientOrdersPage({super.key});

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) => const ClientOrdersPage(),
      routes: routes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClientOrdersBloc>(
          create: (BuildContext context) =>
              getIt<ClientOrdersBloc>()..add(LoadAllClientOrdersEvent()),
        ),
      ],
      child: BePage(
        title: context.l10n.orders,
        automaticallyImplyLeading: false,
        centerTitle: true,
        isBorder: true,
        child: BlocBuilder<ClientOrdersBloc, ClientOrdersState>(
          builder: (context, state) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ClientOrdersBloc>().add(
                  LoadAllClientOrdersEvent(),
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
                          statusLabel = 'Ожидаем курьера';
                        }
                        if (['accepted'].contains(order.status)) {
                          color = .success;
                          statusLabel = 'На скалде';
                        }

                        if (['checked'].contains(order.status)) {
                          color = .success;
                          statusLabel = 'На скалде';
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
                          onTap: () {
                            context.push(ClientOrderPage.location(order.id));
                          },
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
