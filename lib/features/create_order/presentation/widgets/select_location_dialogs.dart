import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/bottom_dialog.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/list_tile.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/presentation/notifier/location_notifier.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/address_select_field.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location_type.dart';
import 'package:fly_cargo/features/destination/domain/entities/locations_entity.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectLocationDialogs {
  const SelectLocationDialogs();

  Future<LocationsEntity?> toSelectAddress(
    BuildContext context,
    CitiesBloc bloc,
    String text,
    LocationsEntity location,
    SelectLocationType type,
    void Function(String city, String address) onChange,
  ) {
    LocationNotifier notifier = LocationNotifier(locations: location);

    return BeBottomDialog.showBottomDialog<LocationsEntity?>(
      context: context,
      maxChildSize: 0.90,
      initialChildSize: 0.90,
      minChildSize: 0.85,
      text: text,
      builder: (BuildContext context, ScrollController controller) {
        return BlocProvider.value(
          value: bloc,
          child: ListenableBuilder(
            listenable: notifier,
            builder: (BuildContext context, Widget? child) {
              return BeDialogBody(
                controller: controller,
                titleVariant: .secondary,
                text: context.l10n.city,
                action: BeButton(
                  text: 'Сохранить',
                  onPressed: () => context.pop(notifier.locations),
                ),
                children: [
                  FieldListTile(
                    label: context.l10n.city,
                    value: notifier.locations.city?.name,
                    variant: .bordered,
                    disabled: location.cities.length == 1,
                    isShowIcon: false,
                    onTap: () {
                      BeBottomDialog.showBottomDialog(
                        context: context,
                        text: context.l10n.city,
                        titleVariant: .secondary,
                        maxChildSize: 0.90,
                        initialChildSize: 0.90,
                        minChildSize: 0.85,
                        builder: (context, controller) {
                          return _DialogCitySelect(
                            controller: controller,
                            notifier: notifier,
                          );
                        },
                      );
                    },
                  ),
                  BeSpace(size: .md),
                  FieldListTile(
                    label: context.l10n.address,
                    value: notifier.locations.address,
                    variant: .bordered,
                    isShowIcon: false,
                    onTap: () {
                      BeBottomDialog.showBottomDialog(
                        context: context,
                        text: context.l10n.address,
                        titleVariant: .secondary,
                        maxChildSize: 0.90,
                        initialChildSize: 0.90,
                        minChildSize: 0.85,
                        builder: (context, controller) {
                          return BlocProvider.value(
                            value: bloc,
                            child: _DialogAddressSelect(
                              notifier: notifier,
                              controller: controller,
                              type: type,
                              onChange: (address) {
                                if (notifier.locations.city != null) {
                                  onChange(
                                    notifier.locations.city!.name,
                                    address,
                                  );
                                }
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                  BeSpace(size: .md),
                  _DialogApartmentSelect(notifier: notifier),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _DialogCitySelect extends StatelessWidget {
  final ScrollController controller;
  final LocationNotifier notifier;

  const _DialogCitySelect({
    required this.notifier,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final local = LocationNotifier(locations: notifier.locations);
    return ListenableBuilder(
      listenable: local,
      builder: (BuildContext context, Widget? child) {
        return BeDialogBody(
          controller: controller,
          titleVariant: .secondary,
          text: context.l10n.city,
          action: BeButton(
            text: 'Сохранить',
            onPressed: () {
              notifier.setLocations(local.locations);
              context.pop();
            },
          ),
          children: local.locations.cities.map((city) {
            return CheckListTile(
              title: city.name,
              isSelected: local.locations.selectedCityId == city.id,
              onTap: () => local.selectCity(city.id),
            );
          }).toList(),
        );
      },
    );
  }
}

class _DialogAddressSelect extends StatefulWidget {
  final LocationNotifier notifier;
  final ScrollController controller;
  final void Function(String value) onChange;
  final SelectLocationType type;

  const _DialogAddressSelect({
    required this.controller,
    required this.notifier,
    required this.onChange,
    required this.type,
  });

  @override
  State<_DialogAddressSelect> createState() => _DialogAddressSelectState();
}

class _DialogAddressSelectState extends State<_DialogAddressSelect> {
  final textController = TextEditingController();

  late final local = LocationNotifier(locations: widget.notifier.locations);

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      local.setAddress(textController.text);
      widget.onChange(textController.text);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: local,
      builder: (BuildContext context, Widget? child) {
        return BeDialogBody(
          controller: widget.controller,
          text: context.l10n.address,
          titleVariant: .secondary,
          action: BeButton(
            text: 'Сохранить',
            onPressed: () {
              widget.notifier.setLocations(local.locations);
              context.pop();
            },
          ),
          children: [
            BlocBuilder<CitiesBloc, CitiesState>(
              builder: (context, state) {
                if (widget.type == .from) {
                  return AddressSelectField(
                    controller: textController,
                    label: context.l10n.address,
                    autofocus: true,
                    value: local.locations.address,
                    completions:
                        (state as CitySelectedState).from.searchQueries,
                  );
                } else {
                  return AddressSelectField(
                    controller: textController,
                    label: context.l10n.address,
                    autofocus: true,
                    value: local.locations.address,
                    completions: (state as CitySelectedState).to.searchQueries,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class _DialogApartmentSelect extends StatefulWidget {
  final LocationNotifier notifier;

  const _DialogApartmentSelect({required this.notifier});

  @override
  State<_DialogApartmentSelect> createState() => _DialogApartmentSelectState();
}

class _DialogApartmentSelectState extends State<_DialogApartmentSelect> {
  late final TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.notifier.locations.apartment,
    );

    textController.addListener(() {
      widget.notifier.setApartment(textController.text);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.notifier,
      builder: (BuildContext context, Widget? child) {
        return BeFormInput(
          variant: .bordered,
          keyboardType: .number,
          label: context.l10n.apartment,
          controller: textController,
        );
      },
    );
  }
}
