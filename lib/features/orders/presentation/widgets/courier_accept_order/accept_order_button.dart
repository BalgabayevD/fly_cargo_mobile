import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/features/orders/presentation/bloc/courier_accept_order_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/widgets/courier_accept_order/accept_order_dialog.dart';

class AcceptOrderButton extends StatelessWidget {
  final int orderId;
  final AcceptOrderDialog dialog;
  const AcceptOrderButton({required this.orderId, super.key})
    : dialog = const AcceptOrderDialog();

  @override
  Widget build(BuildContext context) {
    return BeButton(
      text: 'Еду за посылкой',
      onPressed: () async {
        final time = await dialog.selectTime(context);

        print('TTTIIIE');
        print(time);
        if (time != null && context.mounted) {
          context.read<CourierAcceptOrderBloc>().add(
            CourierAcceptOrderAcceptEvent(orderId, time),
          );
        }
      },
    );
  }
}
