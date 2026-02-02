import 'package:flutter/material.dart' hide SwitchListTile;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';

class CreateOrderPaySide extends StatelessWidget {
  const CreateOrderPaySide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      buildWhen: (previous, state) {
        return previous.data.isPayReceiver != state.data.isPayReceiver;
      },
      builder: (BuildContext context, CreateOrdersState state) {
        return BeSwitchListTile(
          isSelected: state.data.isPayReceiver,
          title: 'Оплата получателем',
          description: 'Доставку оплатит получатель',
          onTap: (value) {
            final field = UpdateOrdersPayReceiverField(value);
            context.read<CreateOrdersBloc>().add(
              UpdateOrdersCreateEvent(field),
            );
          },
        );
      },
    );
  }
}
