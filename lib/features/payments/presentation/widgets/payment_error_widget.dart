import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_event.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class PaymentErrorWidget extends StatelessWidget {
  const PaymentErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              HeroIcons.informationCircle,
              style: HeroIconStyle.outline,
              size: AppSpacing.iconSizeXXL,
              color: AppColors.primary,
            ),
            const SizedBox(height: AppSpacing.xxxl),
            Text(
              context.l10n.paymentFailed,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              context.l10n.tryAgain,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.surface4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.space12),
            SizedBox(
              width: double.infinity,
              height: AppSpacing.buttonHeightXXL,
              child: ElevatedButton(
                onPressed: () {
                  context.read<EpaymentPayBloc>().add(const EpaymentPayReset());
                  context.read<PaymentFlowCubit>().showCards();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                  ),
                ),
                child: Text(
                  context.l10n.openKaspi,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                context.l10n.back,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.surface5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
