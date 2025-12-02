import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_bloc.dart';
import 'package:fly_cargo/shared/orders/presentation/bloc/orders_state.dart';

class CreateOrderButton extends StatelessWidget {
  final OrdersBloc ordersBloc;
  final VoidCallback onPressed;

  const CreateOrderButton({
    required this.ordersBloc,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      bloc: ordersBloc,
      builder: (context, state) {
        final isLoading = state is OrdersLoading;

        return Container(
          width: double.infinity,
          height: AppDimensions.buttonHeightLarge,
          decoration: isLoading ? null : AppDecorations.buttonDecoration(),
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.radiusLG),
              ),
            ),
            child: isLoading
                ? const _LoadingIndicator()
                : const _ButtonContent(),
          ),
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: AppDimensions.progressIndicatorMedium,
      height: AppDimensions.progressIndicatorMedium,
      child: CircularProgressIndicator(
        strokeWidth: AppDimensions.progressStrokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
      ),
    );
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: AppColors.white,
          size: AppSpacing.iconSizeMD,
        ),
        const SizedBox(width: AppSpacing.sm),
        Text(
          'Создать заказ',
          style: AppTypography.buttonLarge.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
