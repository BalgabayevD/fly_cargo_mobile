import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/nothing.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/features/accumulator/presentation/widgets/delivery_confirm_bottom_sheet_widget.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_order_bloc.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AccumulatorOrderDetailScreen extends StatelessWidget {
  static const String path = '/courier/accumulator/orders/:orderId';

  static String location(int orderId) =>
      Uri(path: path.replaceFirst(':orderId', orderId.toString())).toString();

  static GoRoute route({
    List<RouteBase> routes = const <RouteBase>[],
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) {
    return GoRoute(
      path: path,
      builder: (context, state) {
        final orderId = int.parse(state.pathParameters['orderId'] ?? '0');
        return BlocProvider<CourierOrderBloc>(
          create: (_) =>
              getIt<CourierOrderBloc>()..add(CourierOrderLoadEvent(orderId)),
          child: const AccumulatorOrderDetailScreen(),
        );
      },
      routes: routes,
    );
  }

  const AccumulatorOrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourierOrderBloc, CourierOrderState>(
      listener: (context, state) {
        if (state is CourierOrderActionErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is CourierOrderLoadingState) {
          return BePage(
            title: 'Заказ ${state.orderId}',
            backgroundColor: BeColors.white,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final order = _orderFromState(state);
        if (order == null) return const BeNothing();

        final isActionLoading = state is CourierOrderActionLoadingState;

        return BePage(
          backgroundColor: BeColors.white,
          isBorder: true,
          title: 'Заказ ${order.id}',
          trailing: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                size: 20,
                color: BeColors.surface3,
              ),
            ),
          ],
          child: _OrderDetailBodyWidget(
            order: order,
            isActionLoading: isActionLoading,
          ),
        );
      },
    );
  }

  OrderEntity? _orderFromState(CourierOrderState state) {
    if (state is CourierOrderLoadedState) return state.order;
    if (state is CourierOrderActionLoadingState) return state.order;
    if (state is CourierOrderActionErrorState) return state.order;
    return null;
  }
}

class _OrderDetailBodyWidget extends StatelessWidget {
  final OrderEntity order;
  final bool isActionLoading;

  const _OrderDetailBodyWidget({
    required this.order,
    required this.isActionLoading,
  });

  String _formatDate(String dateTime) {
    try {
      final date = DateTime.parse(dateTime);
      final formatter = DateFormat('d MMMM yyyy, HH:mm', 'ru');
      return formatter.format(date.toLocal());
    } catch (_) {
      return dateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const BeSpace(size: .md),

              FlatListTile(
                label: 'Создан',
                value: _formatDate(order.createdAt),
              ),

              FlatListTile(
                label: 'Куда',
                value: 'г. ${order.toCity?.name ?? ''}, ${order.toAddress}',
              ),

              if (order.status == 'arrived') ...[
                FlatListTile(
                  label: 'Описание',
                  value: order.description,
                ),
              ],

              FlatListTile(
                label: 'Вес',
                value: '${order.weight} кг',
              ),

              FlatListTile(
                label: 'Тариф',
                value:
                    '${order.tariff?.name ?? ''}, ${order.tariff?.description ?? ''}',
              ),

              if (order.status == 'delivers_recipient') ...[
                const BeSpace(size: .lg),
                FlatListTile(
                  label: 'Вес',
                  value: order.weight.toString(),
                ),
              ],

              const BeSpace(size: .xxxl),
            ],
          ),
        ),

        _ActionButtonWidget(
          order: order,
          isLoading: isActionLoading,
        ),

        const BeSpace(size: .xxl),
      ],
    );
  }
}

class _ActionButtonWidget extends StatelessWidget {
  final OrderEntity order;
  final bool isLoading;

  const _ActionButtonWidget({
    required this.order,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (order.status == 'arrived') {
      return BeButton(
        text: 'Везу посылку',
        variant: BeButtonVariant.solid,
        color: BeButtonColor.primary,
        isLoading: isLoading,
        onPressed: () {
          context.read<CourierOrderBloc>().add(
            CourierOrderDeliverToReceiverEvent(order.id),
          );
        },
      );
    }

    if (order.status == 'delivers_recipient') {
      return BeButton(
        text: 'Доставлено',
        variant: BeButtonVariant.solid,
        color: BeButtonColor.primary,
        isLoading: isLoading,
        onPressed: () => _showDeliveryConfirm(context),
      );
    }

    return const SizedBox.shrink();
  }

  void _showDeliveryConfirm(BuildContext context) {
    final fromAddress =
        'г. ${order.fromCity?.name ?? ''}, ${order.fromAddress}';

    DeliveryConfirmBottomSheetWidget.show(
      context: context,
      fromAddress: fromAddress,
      onConfirm: (code) {
        Navigator.pop(context);
        context.read<CourierOrderBloc>().add(
          CourierOrderCompleteEvent(order.id, code),
        );
      },
    );
  }
}
