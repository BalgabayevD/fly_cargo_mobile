import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_bloc.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_state.dart';
import 'package:heroicons/heroicons.dart';

class _AddressAutocompleteLoading extends StatelessWidget {
  const _AddressAutocompleteLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class _AddressAutocompleteEmpty extends StatelessWidget {
  const _AddressAutocompleteEmpty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Text(
        'Адреса не найдены',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _AddressAutocompleteItem extends StatelessWidget {
  final AddressModel address;
  final VoidCallback onTap;

  const _AddressAutocompleteItem({
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        onTap();
      },
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            const HeroIcon(
              HeroIcons.mapPin,
              size: 20,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                address.fullAddress ?? address.address,
                style: AppTypography.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressAutocompleteList extends StatelessWidget {
  final List<AddressModel> addresses;
  final Function(AddressModel) onAddressSelected;

  const _AddressAutocompleteList({
    required this.addresses,
    required this.onAddressSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return _AddressAutocompleteItem(
          address: address,
          onTap: () => onAddressSelected(address),
        );
      },
    );
  }
}

class AddressAutocompleteOverlayContent extends StatelessWidget {
  final DestinationBloc destinationBloc;
  final Function(AddressModel) onAddressSelected;

  const AddressAutocompleteOverlayContent({
    required this.destinationBloc,
    required this.onAddressSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: destinationBloc,
      child: BlocBuilder<DestinationBloc, DestinationState>(
        builder: (context, state) {
          if (state is DestinationLoading) {
            return const _AddressAutocompleteLoading();
          }

          if (state is AddressesFound) {
            final addresses = state.addresses;
            if (addresses.isEmpty) {
              return const _AddressAutocompleteEmpty();
            }

            return _AddressAutocompleteList(
              addresses: addresses,
              onAddressSelected: onAddressSelected,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
