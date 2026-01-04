import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_event.dart';
import 'package:fly_cargo/features/payments/presentation/payment_flow_cubit.dart';

class PaymentErrorWidget extends StatelessWidget {
  const PaymentErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xFFFFEBEE),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.info_outline,
                size: 60,
                color: Color(0xFFE53935),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Оплата не прошла',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.surface5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Попробуйте снова',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.surface4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.read<EpaymentPayBloc>().add(const EpaymentPayReset());
                  context.read<PaymentFlowCubit>().showCards();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C3A31),
                  foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Открыть Kaspi.kz',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Назад',
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

