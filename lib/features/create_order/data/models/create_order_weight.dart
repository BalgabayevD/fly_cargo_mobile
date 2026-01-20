import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';

class CreateOrderWeight extends StatefulWidget {
  const CreateOrderWeight({super.key});

  @override
  State<CreateOrderWeight> createState() => _CreateOrderWeightState();
}

class _CreateOrderWeightState extends State<CreateOrderWeight> {
  late final TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    controller = TextEditingController();

    controller.addListener(() {
      final text = controller.text;
      final parsed = double.tryParse(text.replaceAll(',', '.'));

      if (parsed != null) {
        final field = UpdateOrdersWeightField(parsed);
        context.read<CreateOrdersBloc>().add(UpdateOrdersCreateEvent(field));
      }
    });
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
        String value = state.data.weight.toString().replaceAll(
          RegExp(r'\.?0+$'),
          '',
        );

        if (state.data.weight == state.data.weight.toInt()) {
          value = state.data.weight.toInt().toString();
        }

        if (controller.text != value) controller.text = value;
      },
      listenWhen: (CreateOrdersState previous, CreateOrdersState state) {
        return previous.data.weight != state.data.weight;
      },
      builder: (BuildContext context, CreateOrdersState state) {
        return BeFormInput(
          focusNode: focusNode,
          controller: controller,
          keyboardType: .number,
          label: context.l10n.weightInKg,
          errors: [state.errors['weight']],
        );
      },
    );
  }
}
