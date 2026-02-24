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
        final Widget child;

        if (state is ShiftErrorState) {
          child = _ShiftErrorCard(
            key: const ValueKey('error'),
            message: state.message,
            onRetry: () => context.read<ShiftBloc>().add(ShiftLoadStatusEvent()),
          );
        } else if (state is ShiftLoadedState) {
          child = _ShiftCard(
            key: const ValueKey('card'),
            shift: state.shift,
            isLoading: false,
          );
        } else if (state is ShiftActionInProgressState) {
          child = _ShiftCard(
            key: const ValueKey('card'),
            shift: state.shift,
            isLoading: true,
          );
        } else {
          child = const SizedBox.shrink(key: ValueKey('empty'));
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          transitionBuilder: (child, animation) => SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: child,
        );
      },
    );
  }
}

class _ShiftCard extends StatelessWidget {
  final ShiftEntity shift;
  final bool isLoading;

  const _ShiftCard({required this.shift, required this.isLoading, super.key});

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
          SizedBox(
            width: 96,
            child: BeButton(
              text: isLoading ? null : (isActive ? 'Закрыть' : 'Открыть'),
              color: isActive ? BeButtonColor.danger : BeButtonColor.primary,
              variant: BeButtonVariant.solid,
              size: BeButtonSize.sm,
              onPressed: isLoading
                  ? null
                  : () => context.read<ShiftBloc>().add(
                        isActive ? ShiftCloseEvent() : ShiftOpenEvent(),
                      ),
              child: isLoading
                  ? SizedBox.square(
                      dimension: 16,
                      child: CircularProgressIndicator(
                        color: BeColors.white,
                        strokeWidth: 3,
                        backgroundColor: BeColors.none,
                        strokeCap: StrokeCap.round,
                      ),
                    )
                  : null,
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

class _ShiftErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ShiftErrorCard({required this.message, required this.onRetry, super.key});

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
