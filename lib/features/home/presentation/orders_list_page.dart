import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/pages/order_detail_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/order_card.dart';
import 'package:fly_cargo/shared/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/shared/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/shared/orders/data/models/order_model.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_event.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';

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
    final authState = context.read<AuthBloc>().state;
    if (authState is! AuthAuthenticated) {
      context.read<OrdersBloc>().add(const GetClientOrdersEvent());
      return;
    }

    final userType = authState.userType;
    if (userType.isCourier) {
      if (_selectedTabIndex == 0) {
        context.read<OrdersBloc>().add(const GetCourierOrdersEvent());
      } else {
        context.read<OrdersBloc>().add(const GetCreatedOrdersEvent());
      }
    } else {
      context.read<OrdersBloc>().add(const GetClientOrdersEvent());
    }
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final isCourier =
        authState is AuthAuthenticated && authState.userType.isCourier;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Заказы',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (isCourier) _buildTabs(),
          Expanded(
            child: BlocListener<OrdersBloc, OrdersState>(
              listener: (context, state) {
                if (state is OrderDetailLoaded) {
                  // Навигация к экрану деталей заказа
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderDetailPage(order: state.order),
                    ),
                  );
                }
              },
              child: BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state is OrdersUnauthorized) {
                    return const _UnauthorizedStateWidget();
                  }

                  if (state is OrdersError) {
                    return _ErrorStateWidget(message: state.message);
                  }

                  if (state is OrdersLoaded) {
                    if (state.orders.isEmpty) {
                      return const _EmptyStateWidget();
                    }
                    return _OrdersListWidget(orders: state.orders);
                  }

                  return const _EmptyStateWidget();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _onTabChanged(0),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 0
                        ? const Color(0xFFD97D4E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMD - 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Новые',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedTabIndex == 0
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onTabChanged(1),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedTabIndex == 1
                        ? const Color(0xFFD97D4E)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      AppSpacing.radiusMD - 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Мои',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _selectedTabIndex == 1
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index, bool isSelected) {
    return GestureDetector(
      onTap: () => _onTabChanged(index),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD97D4E) : AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
          border: Border.all(
            color: isSelected ? const Color(0xFFD97D4E) : AppColors.border,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _OrdersListWidget extends StatelessWidget {
  final List<OrderModel> orders;

  const _OrdersListWidget({required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.md),
          child: OrderCard(
            order: order,
            onTap: () {
              context.read<OrdersBloc>().add(
                GetOrderByIdEvent(orderId: order.id.toString()),
              );
            },
          ),
        );
      },
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.inbox_outlined,
                size: 60,
                color: AppColors.textTertiary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Text(
              'У вас пока нет заказов',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Создайте свой первый заказ\nна главной странице',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _UnauthorizedStateWidget extends StatelessWidget {
  const _UnauthorizedStateWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_outline,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            const Text(
              'Требуется авторизация',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            const Text(
              'Для просмотра заказов\nнеобходимо войти в аккаунт',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorStateWidget extends StatelessWidget {
  final String message;

  const _ErrorStateWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 60,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'Произошла ошибка',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
