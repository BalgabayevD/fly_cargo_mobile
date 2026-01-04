import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_bloc.dart';
import 'package:fly_cargo/features/payments/presentation/epayment_pay/bloc/epayment_pay_event.dart';
import 'package:fly_cargo/features/payments/presentation/widgets/cards_list/payment_styles.dart';

/// Виджет нижних кнопок (оплата и назад)
class CardsListFooterWidget extends StatelessWidget {
  final int orderId;
  final int? selectedCardId;

  const CardsListFooterWidget({
    required this.orderId,
    required this.selectedCardId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _buildContainerDecoration(),
      child: Column(
        children: [
          _buildPaymentButton(context),
          const SizedBox(height: 12),
          _buildBackButton(context),
        ],
      ),
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, -5),
        ),
      ],
    );
  }

  Widget _buildPaymentButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: selectedCardId != null
            ? () => _onPaymentPressed(context)
            : null,
        style: _buildPaymentButtonStyle(context),
        child: Text(
          'Оплатить',
          style: context.buttonTextStyle,
        ),
      ),
    );
  }

  ButtonStyle _buildPaymentButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: context.paymentPrimaryColor,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.surface2,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.cardBorderRadius),
      ),
    );
  }

  void _onPaymentPressed(BuildContext context) {
    context.read<EpaymentPayBloc>().add(
      EpaymentPayRequested(
        paymentCardId: selectedCardId!,
        orderId: orderId,
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text(
        'Назад',
        style: TextStyle(
          fontSize: 16,
          color: AppColors.surface5,
        ),
      ),
    );
  }
}
