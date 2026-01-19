import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';

class CreateOrderDescription extends StatefulWidget {
  const CreateOrderDescription({super.key});

  @override
  State<CreateOrderDescription> createState() => _CreateOrderDescriptionState();
}

class _CreateOrderDescriptionState extends State<CreateOrderDescription> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    final state = context.read<CreateOrdersBloc>().state;
    if (state is CreateOrdersCreateState) {
      controller.text = state.data.description;
    }

    controller.addListener(_onTextChanged);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrdersBloc, CreateOrdersState>(
      listener: (BuildContext context, CreateOrdersState current) {
        if (current is CreateOrdersCreateState) {
          controller.text = current.data.description;
        }
      },
      listenWhen: (previous, current) {
        return previous is CreateOrdersCreateState &&
            current is CreateOrdersCreateState &&
            previous.data.description != current.data.description;
      },
      child: BeFormInput(
        label: context.l10n.description,
        controller: controller,
      ),
    );
  }

  void _onTextChanged() {
    context.read<CreateOrdersBloc>().add(
      UpdateOrdersCreateEvent(
        UpdateOrdersDescriptionField(controller.text),
      ),
    );
  }
}
