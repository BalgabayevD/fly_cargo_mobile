import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
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
        if (state is CitySelectedState && type == .from) {
          return FieldListTile(
            label: label,
            value: "1",
            onTap: () async {
              final location = await showDialog.toSelectAddress(
                context,
                label,
                state.from,
              );

              if (location != null && context.mounted) {
                context.read<CitiesBloc>().add(TouchFromCityEvent(location));

                final field = UpdateOrdersLocationField(
                  fromCityId: location.selectedCityId ?? 0,
                  fromAddress: location.address ?? '',
                  fromFloor: location.floor ?? '',
                  fromEntrance: location.entrance ?? '',
                  fromApartment: location.apartment ?? '',
                  fromLatitude: location.latitude ?? 0,
                  fromLongitude: location.longitude ?? 0,

                  toCityId: state.to.selectedCityId ?? 0,
                  toAddress: state.to.address ?? '',
                  toFloor: state.to.floor ?? '',
                  toEntrance: state.to.entrance ?? '',
                  toApartment: state.to.apartment ?? '',
                  toLatitude: state.to.latitude ?? 0,
                  toLongitude: state.to.longitude ?? 0,
                );

                context.read<CreateOrdersBloc>().add(
                  UpdateOrdersCreateEvent(field),
                );
              }
            },
          );
        }

        if (state is CitySelectedState && type == .to) {
          return FieldListTile(
            label: label,
            value: '2',
            onTap: () async {
              final location = await showDialog.toSelectAddress(
                context,
                label,
                state.to,
              );

              if (location != null && context.mounted) {
                context.read<CitiesBloc>().add(TouchToCityEvent(location));

                final field = UpdateOrdersLocationField(
                  fromCityId: state.from.selectedCityId ?? 0,
                  fromAddress: state.from.address ?? '',
                  fromFloor: state.from.floor ?? '',
                  fromEntrance: state.from.entrance ?? '',
                  fromApartment: state.from.apartment ?? '',
                  fromLatitude: state.from.latitude ?? 0,
                  fromLongitude: state.from.longitude ?? 0,

                  toCityId: location.selectedCityId ?? 0,
                  toAddress: location.address ?? '',
                  toFloor: location.floor ?? '',
                  toEntrance: location.entrance ?? '',
                  toApartment: location.apartment ?? '',
                  toLatitude: location.latitude ?? 0,
                  toLongitude: location.longitude ?? 0,
                );

                context.read<CreateOrdersBloc>().add(
                  UpdateOrdersCreateEvent(field),
                );
              }
            },
          );
        }

        return FieldListTile(label: label, disabled: true);
      },
    );
  }
}
