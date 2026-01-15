import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_dialogs.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_type.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart';

class SelectLocation extends StatelessWidget {
  final SelectLocationDialogs showDialog;
  final SelectLocationType type;

  const SelectLocation({
    required this.type,
    super.key,
  }) : showDialog = const SelectLocationDialogs();

  @override
  Widget build(BuildContext context) {
    final label = type == SelectLocationType.from
        ? context.l10n.from
        : context.l10n.to;

    return BlocBuilder<CitiesBloc, CitiesState>(
      builder: (BuildContext context, CitiesState state) {
        if (state is FromCityTouchedLoadedState && type == .from) {
          return FieldListTile(
            label: label,
            value: state.from.listTileLabel,
            onTap: () {
              showDialog.toSelectAddress(
                context,
                label,
                state.from,
              );
            },
          );
        }

        if (state is FromCityTouchedLoadedState && type == .to) {
          return FieldListTile(
            label: label,
            value: state.to.listTileLabel,
            onTap: () {
              showDialog.toSelectAddress(
                context,
                label,
                state.to,
              );
            },
          );
        }

        return FieldListTile(label: label);
      },
    );
  }
}
