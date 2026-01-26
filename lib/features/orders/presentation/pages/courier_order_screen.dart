import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/components/timeline.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/client_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/courier_orders_screen.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/client_order/photo_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CourierOrderScreen extends StatelessWidget {
  static const String path = '/courier/orders/:orderId';

  static String location(int orderId) =>
      Uri(path: path.replaceFirst(':orderId', orderId.toString())).toString();

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      redirect: (context, state) {
        final orderId = state.pathParameters['orderId'];

        if (orderId == null || orderId.isEmpty) {
          return CourierOrdersPage.location();
        }

        if (int.tryParse(orderId) == null) {
          return CourierOrdersPage.location();
        }

        return null;
      },
      builder: (BuildContext context, state) {
        final orderId = int.parse(state.pathParameters['orderId']!);

        return BlocProvider<CourierOrderBloc>(
          create: (BuildContext context) {
            return getIt<CourierOrderBloc>()
              ..add(CourierOrderLoadEvent(orderId));
          },
          child: CourierOrderScreen(),
        );
      },
      routes: routes,
    );
  }

  const CourierOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourierOrderBloc, CourierOrderState>(
      builder: (BuildContext context, CourierOrderState state) {
        if (state is CourierOrderLoadingState) {
          return BePage(
            title: 'Заказ №${state.orderId}',
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CourierOrderLoadedState) {
          return BePage(
            backgroundColor: BeColors.white,
            isBorder: true,
            title: 'Заказ ${state.order.id}',
            actions: BeButton(
              text: 'Принять',
              variant: .solid,
              color: .primary,
            ),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ClientOrderBloc>().add(
                  ClientOrderLoadEvent(state.order.id),
                );
                await Future.delayed(Duration(seconds: 1));
              },
              child: ListView(
                children: [
                  BeSpace(size: .md),

                  if (state.order.status == 'created')
                    Text(
                      'Посылка от ',
                      style: GoogleFonts.montserrat(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: BeColors.surface5,
                      ),
                    ),

                  if (state.order.status == 'accepted' &&
                      state.order.identifications.isEmpty)
                    Text(
                      'Привяжите QR код',
                      style: GoogleFonts.montserrat(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: BeColors.surface5,
                      ),
                    ),

                  if (state.order.status == 'accepted' &&
                      state.order.identifications.isNotEmpty)
                    Text(
                      'Ожидает доставки на склад',
                      style: GoogleFonts.montserrat(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: BeColors.surface5,
                      ),
                    ),

                  BeSpace(size: .xl),

                  ...state.timeline.map((data) {
                    return BeTimeline(
                      isFirst: data.isFirst,
                      isLast: data.isLast,
                      isSelected: data.isSelected,
                      title: data.title,
                      description: data.description,
                    );
                  }),

                  BeSpace(size: .xl),
                  BeButton(
                    text: 'Привязать QR',
                    onPressed: () {},
                    variant: .flat,
                    color: .primary,
                  ),
                  BeSpace(size: .xxxl),

                  FlatListTile(
                    label: 'Откуда',
                    value:
                        '${state.order.fromCity?.name ?? ''}, ${state.order.fromAddress}, кв: ${state.order.fromApartment}',
                  ),

                  FlatListTile(
                    label: 'Куда',
                    value:
                        '${state.order.toCity?.name ?? ''}, ${state.order.toAddress}, кв: ${state.order.toApartment}',
                  ),

                  FlatListTile(
                    label: context.l10n.recipientLabel,
                    value:
                        '${state.order.toName ?? ''}, ${state.order.toPhone ?? ''}',
                  ),

                  FlatListTile(
                    label: 'Тариф',
                    value:
                        '${state.order.tariff?.name}, ${state.order.tariff?.description}',
                  ),

                  FlatListTile(
                    label: 'Вес',
                    value: '${state.order.weight}',
                  ),

                  FlatListTile(
                    label: 'Цена',
                    value: '${state.order.price}',
                  ),

                  FlatListTile(
                    label: 'Оплочен',
                    value: state.order.isPaid ? 'Да' : 'Нет',
                  ),

                  FlatListTile(
                    isFluid: true,
                    label: context.l10n.description,
                    value: state.order.description,
                  ),

                  BeSpace(size: .xxl),

                  if (state.order.photos.isNotEmpty)
                    PhotoGridView(photos: state.order.photos),

                  BeSpace(size: .xxl),

                  BeButton(
                    text: 'Отклонить',
                    variant: .flat,
                    color: .danger,
                  ),

                  BeSpace(size: .xxxl),
                  BeSpace(size: .xxxl),
                  BeSpace(size: .xxxl),
                  BeSpace(size: .xxxl),
                ],
              ),
            ),
          );
        }

        return BeNothing();
      },
    );
  }
}
