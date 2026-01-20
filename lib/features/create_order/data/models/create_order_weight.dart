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

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    return BlocListener<CreateOrdersBloc, CreateOrdersState>(
      listener: (BuildContext context, CreateOrdersState current) {
        if (current is CreateOrdersCreateState) {
          controller.text = current.data.weight.toString();
        }
      },
      listenWhen: (CreateOrdersState previous, CreateOrdersState current) {
        if (previous is CreateOrdersCreateState &&
            current is CreateOrdersCreateState) {
          return previous.data.weight != current.data.weight;
        }
        return false;
      },
      child: BeFormInput(
        controller: controller,
        keyboardType: .number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Обязательное поле';
          }
          return null;
        },
        label: context.l10n.weightInKg,
      ),
    );
  }
}
