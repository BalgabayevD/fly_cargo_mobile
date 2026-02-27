import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/chip.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/client_orders_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_page.dart';
import 'package:fly_cargo/shared/utils/helper.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';
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
        padding: EdgeInsets.zero,
        title: context.l10n.orders,
        backgroundColor: BeColors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
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
                  if (state.isLoading)
                    BeChip(
                      text: 'Загрузка',
                      isLoading: true,
                      color: .gray,
                    ),
                  BeSpace(size: .md),
                  SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: .horizontal,
                      children: [
                        BeSpace(
                          size: .xxl,
                          direction: .vertical,
                        ),
                        BeChip(
                          text: 'Все заказы',
                        ),
                        BeSpace(
                          size: .md,
                          direction: .vertical,
                        ),
                        BeChip(
                          text: 'Мой заказы',
                          variant: .faded,
                        ),
                        BeSpace(
                          size: .md,
                          direction: .vertical,
                        ),
                        BeChip(
                          text: 'Отправленные мне',
                          variant: .faded,
                        ),
                        BeSpace(
                          size: .xxl,
                          direction: .vertical,
                        ),
                      ],
                    ),
                  ),
                  BeSpace(size: .xxl),
                  if (state.orders.isNotEmpty)
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (BuildContext context, int index) {
                        final order = state.orders[index];
                        final created = DateTime.parse(order.createdAt);

                        return ListTile(
                          onTap: () =>
                              context.push(ClientOrderPage.location(order.id)),
                          leading: CircleAvatar(
                            radius: 36,
                            backgroundColor: BeColors.surface2,
                            child: order.photos.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.all(1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(56),
                                      child: Image.network(
                                        order.photos.first,
                                        fit: .cover,
                                        height: 54,
                                        width: 54,
                                        errorBuilder: (_, _, _) {
                                          return HeroIcon(
                                            HeroIcons.photo,
                                            color: BeColors.primary,
                                            size: 36,
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                : HeroIcon(
                                    HeroIcons.photo,
                                    color: BeColors.primary,
                                    size: 36,
                                  ),
                          ),
                          title: Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Text(
                                formatOrderId(order.id),
                                style: TextStyle(
                                  fontWeight: .w600,
                                ),
                              ),
                              Row(
                                spacing: 4,
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    DateFormat(
                                      'dd.MM.yy',
                                      'ru_RU',
                                    ).format(created),
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  HeroIcon(
                                    index % 2 == 1
                                        ? HeroIcons.arrowDownLeft
                                        : HeroIcons.arrowUpRight,
                                    color: BeColors.surface5,
                                    style: .solid,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          subtitle: Text(order.toStatus()),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            SizedBox(width: 105),
                            Expanded(child: Divider()),
                          ],
                        );
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
