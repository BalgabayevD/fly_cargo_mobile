import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/auth/domain/entities/user_type.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fly_cargo/features/auth/presentation/bloc/auth_state.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_event.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/orders_list_state.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_detail_page.dart';

/// Страница-загрузчик деталей заказа по ID
/// Используется когда заказ не передан через extra (DevTools, deep links, etc.)
class OrderDetailLoaderPage extends StatefulWidget {
  final String orderId;

  const OrderDetailLoaderPage({
    required this.orderId,
    super.key,
  });

  @override
  State<OrderDetailLoaderPage> createState() => _OrderDetailLoaderPageState();
}

class _OrderDetailLoaderPageState extends State<OrderDetailLoaderPage> {
  @override
  void initState() {
    super.initState();
    // Загружаем заказ по ID
    context.read<OrdersListBloc>().add(
      GetOrderByIdEvent(orderId: widget.orderId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    final userType = authState is AuthAuthenticated
        ? authState.userType
        : UserType.user;

    return BlocBuilder<OrdersListBloc, OrdersListState>(
      builder: (context, state) {
        if (state is OrderDetailLoaded) {
          // Заказ загружен - показываем страницу деталей
          return ClientOrderDetailPage(
            order: state.order,
            userType: userType,
          );
        }

        if (state is OrdersListError) {
          // Ошибка загрузки
          return Scaffold(
            appBar: AppBar(
              title: const Text('Заказ'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ошибка загрузки заказа',
                    style: AppTypography.h6,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.message,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.surface4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<OrdersListBloc>().add(
                        GetOrderByIdEvent(orderId: widget.orderId),
                      );
                    },
                    child: const Text('Повторить'),
                  ),
                ],
              ),
            ),
          );
        }

        // Загрузка
        return Scaffold(
          appBar: AppBar(
            title: const Text('Заказ'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  'Загрузка заказа #${widget.orderId}...',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.surface4,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
