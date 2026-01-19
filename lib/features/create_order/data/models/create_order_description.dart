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

    controller.addListener(() {
      final field = UpdateOrdersDescriptionField(controller.text);
      context.read<CreateOrdersBloc>().add(UpdateOrdersCreateEvent(field));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateOrdersBloc, CreateOrdersState>(
      listener: (BuildContext context, CreateOrdersState current) {
        if (current is CreateOrdersCreateState) {
          controller.text = current.data.description;
        }
      },
      listenWhen: (CreateOrdersState previous, CreateOrdersState current) {
        if (previous is CreateOrdersCreateState &&
            current is CreateOrdersCreateState) {
          return previous.data.description != current.data.description;
        }
        return false;
      },
      child: BeFormInput(
        label: context.l10n.description,
        controller: controller,
      ),
    );
  }
}
