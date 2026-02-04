import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_decline_order/decline_order_dialog.dart';

class CourierDeclineOrderButton extends StatelessWidget {
  final int orderId;
  final bool isLoading;
  final DeclineOrderDialog dialog;
  const CourierDeclineOrderButton({
    required this.orderId,
    this.isLoading = false,
    super.key,
  }) : dialog = const DeclineOrderDialog();

  @override
  Widget build(BuildContext context) {
    return BeButton(
      text: 'Отклонить',
      variant: .flat,
      color: .danger,
      isLoading: isLoading,
      onPressed: () async {
        final decline = await dialog.reason(context);

        if (decline != null && context.mounted) {
          context.read<CourierOrderBloc>().add(
            CourierOrderDeclineEvent(orderId, decline.$1, decline.$2),
          );
        }
      },
    );
  }
}
