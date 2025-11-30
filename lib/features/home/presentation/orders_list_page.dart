import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';

/// Страница списка заказов для вкладки "Заказы"
class OrdersListPage extends StatelessWidget {
  const OrdersListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          }

          if (state is OrdersError) {
            return _ErrorStateWidget(message: state.message);
          }

          // Временная заглушка с пустым состоянием
          return const _EmptyStateWidget();
        },
      ),
    );
  }
}

/// Виджет пустого состояния
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

/// Виджет состояния ошибки
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
