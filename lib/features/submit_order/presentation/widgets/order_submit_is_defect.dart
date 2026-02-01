import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/features/submit_order/presentation/bloc/courier_submit_order_bloc.dart';

class OrderSubmitIsDefect extends StatelessWidget {
  final bool isDefect;
  const OrderSubmitIsDefect({super.key, this.isDefect = false});

  void onTap(BuildContext context, bool isDefect) {
    final field = UpdateOrdersDefectField(isDefect);

    context.read<CourierSubmitOrderBloc>().add(
      CourierSubmitOrderUpdateEvent(field),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      children: [
        CheckListTile(
          title: 'Без деффектов',
          isSelected: !isDefect,
          onTap: () => onTap(context, false),
        ),
        BeSpace(size: .md),
        CheckListTile(
          title: 'Есть деффект',
          isSelected: isDefect,
          onTap: () => onTap(context, true),
        ),
      ],
    );
  }
}
