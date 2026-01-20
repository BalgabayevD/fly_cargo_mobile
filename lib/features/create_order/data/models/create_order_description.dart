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
  late final FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    controller = TextEditingController();

    final state = context.read<CreateOrdersBloc>().state;
    controller.text = state.data.description;

    controller.addListener(_onTextChanged);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOrdersBloc, CreateOrdersState>(
      listener: (BuildContext context, CreateOrdersState state) {
        controller.text = state.data.description;
      },
      listenWhen: (previous, state) {
        return previous.data.description != state.data.description;
      },
      builder: (BuildContext context, CreateOrdersState state) {
        return BeFormInput(
          focusNode: focusNode,
          label: context.l10n.description,
          controller: controller,
          errors: [state.errors['description']],
        );
      },
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
