import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/bloc/create_orders_bloc.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_dialogs.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_type.dart';
import 'package:fly_cargo/features/destination/domain/entities/city_entity.dart';
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

    return BlocBuilder<CreateOrdersBloc, CreateOrdersState>(
      builder: (BuildContext context, CreateOrdersState ordersState) {
        return BlocBuilder<CitiesBloc, CitiesState>(
          builder: (BuildContext context, CitiesState state) {
            if (state is CitySelectedState && type == .from) {
              final fromValue = StateLocation(state.from.cities);

              return FieldListTile(
                label: label,
                value: fromValue.toTileValue(
                  ordersState.data.fromCityId == 0 &&
                          state.from.selectedCityId != null
                      ? state.from.selectedCityId!
                      : ordersState.data.fromCityId,
                  ordersState.data.fromAddress,
                ),
                errors: [
                  ordersState.errors['fromAddress'],
                  ordersState.errors['fromCityId'],
                ],
                onTap: () async {
                  final location = await showDialog.toSelectAddress(
                    context,
                    label,
                    state.from.copyWith(
                      selectedCityId:
                          ordersState.data.fromCityId == 0 &&
                              state.from.selectedCityId != null
                          ? state.from.selectedCityId!
                          : ordersState.data.fromCityId,
                      address: ordersState.data.fromAddress,
                      floor: ordersState.data.fromFloor,
                      entrance: ordersState.data.fromEntrance,
                      apartment: ordersState.data.fromApartment,
                      latitude: ordersState.data.fromLatitude,
                      longitude: ordersState.data.fromLongitude,
                    ),
                  );

                  if (location != null && context.mounted) {
                    context.read<CitiesBloc>().add(
                      TouchFromCityEvent(location),
                    );

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
              final toValue = StateLocation(state.to.cities);
              return FieldListTile(
                label: label,
                value: toValue.toTileValue(
                  ordersState.data.toCityId == 0 &&
                          state.to.selectedCityId != null
                      ? state.to.selectedCityId!
                      : ordersState.data.toCityId,
                  ordersState.data.toAddress,
                ),
                errors: [
                  ordersState.errors['toAddress'],
                  ordersState.errors['toCityId'],
                ],
                onTap: () async {
                  final location = await showDialog.toSelectAddress(
                    context,
                    label,
                    state.to.copyWith(
                      selectedCityId:
                          ordersState.data.toCityId == 0 &&
                              state.to.selectedCityId != null
                          ? state.to.selectedCityId!
                          : ordersState.data.toCityId,
                      address: ordersState.data.toAddress,
                      floor: ordersState.data.toFloor,
                      entrance: ordersState.data.toEntrance,
                      apartment: ordersState.data.toApartment,
                      latitude: ordersState.data.toLatitude,
                      longitude: ordersState.data.toLongitude,
                    ),
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
      },
    );
  }
}

class StateLocation {
  final List<CityEntity> cities;

  const StateLocation(this.cities);

  String? toTileValue(int cityId, String address) {
    final any = cities.any((c) => c.id == cityId);
    if (!any) return null;

    final city = cities.firstWhere((c) => c.id == cityId);
    return <String>[
      city.name,
      if (address.isNotEmpty) address,
    ].join(', ');
  }
}
