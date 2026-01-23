import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/orders/presentation/pages/client_order_page.dart';
import 'package:go_router/go_router.dart';

class CreateOrdersSubmitButton extends StatelessWidget {
  const CreateOrdersSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOrdersBloc, CreateOrdersState>(
      listener: (BuildContext context, CreateOrdersState state) {
        if (state.createdOrderId != null) {
          context.push(ClientOrderPage.location(state.createdOrderId!));
          context.read<CreateOrdersBloc>().add(ResetOrdersCreateEvent());
        }
      },
      listenWhen: (CreateOrdersState previous, CreateOrdersState state) {
        return previous.isSubmitting != state.isSubmitting &&
            previous.createdOrderId != state.createdOrderId;
      },
      buildWhen: (previous, current) =>
          previous.price != current.price ||
          previous.isSubmitting != previous.isSubmitting,
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
