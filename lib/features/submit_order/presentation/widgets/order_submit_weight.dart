import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart';

class OrderSubmitWeight extends StatefulWidget {
  final double weight;
  const OrderSubmitWeight({required this.weight, super.key});

  @override
  State<OrderSubmitWeight> createState() => _OrderSubmitWeightState();
}

class _OrderSubmitWeightState extends State<OrderSubmitWeight> {
  late final TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    final initialValue = _formatWeight(widget.weight);
    controller = TextEditingController(text: initialValue);

    controller.addListener(_onTextChanged);
    super.initState();
  }

  void _onTextChanged() {
    final text = controller.text;
    final parsed = double.tryParse(text.replaceAll(',', '.'));

    if (parsed != null) {
      final field = UpdateOrdersWeightField(parsed);

      context.read<CourierSubmitOrderBloc>().add(
        CourierSubmitOrderUpdateEvent(field),
      );
    }
  }

  String _formatWeight(double weight) {
    if (weight == 0) {
      return '';
    }
    if (weight == weight.toInt()) {
      return weight.toInt().toString();
    }
    return weight.toString().replaceAll(RegExp(r'\.?0+$'), '');
  }

  @override
  void didUpdateWidget(OrderSubmitWeight oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.weight != widget.weight) {
      final newValue = _formatWeight(widget.weight);
      if (controller.text != newValue) {
        controller.text = newValue;
      }
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BeFormInput(
      focusNode: focusNode,
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      label: context.l10n.weightInKg,
    );
  }
}
