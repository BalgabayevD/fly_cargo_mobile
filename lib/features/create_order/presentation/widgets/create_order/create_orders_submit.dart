import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';

class CreateOrdersSubmitButton extends StatelessWidget {
  const CreateOrdersSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BeButton(
      text: context.l10n.createOrder,
      color: .primary,
      onPressed: () => context.read<SubmitOrdersCreateEvent>(),
    );
  }
}
