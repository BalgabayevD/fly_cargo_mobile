import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/core/router/app_router.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_state.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_orders_tabs_widget.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/orders_list/empty_orders_state.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/orders_list/error_orders_state.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/orders_list/orders_list.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/orders_list/unauthorized_orders_state.dart';
import 'package:fly_cargo/features/shared/orders/domain/entities/order_entity.dart';
import 'package:go_router/go_router.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({super.key});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();
}

class _OrdersListPageState extends State<OrdersListPage> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadOrders();
    });
  }

  void _loadOrders() {
    // final authState = context.read<AuthBloc>().state;
    // if (authState is! AuthAuthenticated) {
    //   context.read<OrdersListBloc>().add(const GetClientOrdersListEvent());
    //   return;
    // }
    //
    // final userType = authState.userType;
    // if (userType.isCourier) {
    //   if (_selectedTabIndex == 0) {
    //     context.read<OrdersListBloc>().add(const GetCreatedOrdersListEvent());
    //   } else {
    //     context.read<OrdersListBloc>().add(const GetCourierOrdersListEvent());
    //   }
    // } else {
    //   context.read<OrdersListBloc>().add(const GetClientOrdersListEvent());
    // }
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _loadOrders();
  }

  void _onOrderTap(OrderEntity order) {
    context
        .push('${AppRoutes.orders}/${AppRoutes.orderDetail}/${order.id}')
        .then((_) => _loadOrders());
  }

  @override
  Widget build(BuildContext context) {
    // final authState = context.watch<AuthBloc>().state;
    // final isCourier =
    //     authState is AuthAuthenticated && authState.userType.isCourier;
    final isCourier = false;

    return BePage(
      title: context.l10n.orders,
      automaticallyImplyLeading: false,
      centerTitle: true,
      isBorder: true,
      child: Column(
        children: [
          if (isCourier)
            CourierOrdersTabsWidget(
              selectedTabIndex: _selectedTabIndex,
              onTabChanged: _onTabChanged,
            ),
          Expanded(
            child: BlocBuilder<OrdersListBloc, OrdersListState>(
              builder: (context, state) {
                if (state is OrdersListLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                if (state is OrdersListUnauthorized) {
                  return const UnauthorizedOrdersListState();
                }

                if (state is OrdersListError) {
                  return ErrorOrdersListState(message: state.message);
                }

                if (state is OrdersListLoaded) {
                  if (state.orders.isEmpty) {
                    return const EmptyOrdersListState();
                  }
                  return OrdersList(
                    orders: state.orders,
                    onOrderTap: _onOrderTap,
                  );
                }

                return const EmptyOrdersListState();
              },
            ),
          ),
        ],
      ),
    );
  }
}
