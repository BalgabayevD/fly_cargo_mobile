import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';

class CreateOrdersSubmitButton extends StatelessWidget {
  const CreateOrdersSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      buildWhen: (previous, current) => previous.price != current.price,
      builder: (BuildContext context, CreateOrdersState state) {
        return BeButton(
          text: state.price == 0
              ? 'Отправить'
              : 'Отправить за ${state.price.ceil()} тг',
          color: .primary,
          onPressed: () =>
              context.read<CreateOrdersBloc>().add(SubmitOrdersCreateEvent()),
        );
      },
    );
  }
}
