import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/features/shift/domain/entities/shift_entity.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_bloc.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_event.dart';
import 'package:fly_cargo/features/shift/presentation/bloc/shift_state.dart';

class ShiftStatusWidget extends StatelessWidget {
  const ShiftStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShiftBloc, ShiftState>(
      builder: (context, state) {
        if (state is ShiftInitialState || state is ShiftLoadingState) {
          return const _ShiftCardSkeleton();
        }

        if (state is ShiftErrorState) {
          return _ShiftErrorCard(
            message: state.message,
            onRetry: () => context.read<ShiftBloc>().add(ShiftLoadStatusEvent()),
          );
        }

        if (state is ShiftLoadedState) {
          return _ShiftCard(shift: state.shift, isLoading: false);
        }

        if (state is ShiftActionInProgressState) {
          return _ShiftCard(shift: state.shift, isLoading: true);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class _ShiftCard extends StatelessWidget {
  final ShiftEntity shift;
  final bool isLoading;

  const _ShiftCard({required this.shift, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final isActive = shift.isActive;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive ? BeColors.successLight : BeColors.surface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? BeColors.success : BeColors.border,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          _ShiftStatusIndicator(isActive: isActive),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Смена',
                  style: TextStyle(
                    fontSize: 12,
                    color: BeColors.surface4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isActive ? 'Активна' : 'Не открыта',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isActive ? BeColors.success : BeColors.surface5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          BeButton(
            text: isActive ? 'Закрыть' : 'Открыть',
            color: isActive ? BeButtonColor.danger : BeButtonColor.primary,
            variant: BeButtonVariant.solid,
            size: BeButtonSize.sm,
            isLoading: isLoading,
            onPressed: isLoading
                ? null
                : () => context.read<ShiftBloc>().add(
                      isActive ? ShiftCloseEvent() : ShiftOpenEvent(),
                    ),
          ),
        ],
      ),
    );
  }
}

class _ShiftStatusIndicator extends StatelessWidget {
  final bool isActive;

  const _ShiftStatusIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? BeColors.success : BeColors.surface3,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _ShiftCardSkeleton extends StatelessWidget {
  const _ShiftCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: BeColors.surface2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BeColors.border, width: 1),
      ),
      child: const Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _ShiftErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ShiftErrorCard({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: BeColors.dangerLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: BeColors.danger, width: 1),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: BeColors.danger, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 13,
                color: BeColors.danger,
              ),
            ),
          ),
          TextButton(
            onPressed: onRetry,
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}
