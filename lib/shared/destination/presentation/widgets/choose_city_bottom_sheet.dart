import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_bloc.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_event.dart';
import 'package:fly_cargo/shared/destination/presentation/bloc/destination_state.dart';
import 'package:fly_cargo/shared/destination/presentation/models/city_type.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/city_bottom_sheet_states.dart';
import 'package:fly_cargo/shared/destination/presentation/widgets/city_radio_option.dart';
import 'package:heroicons/heroicons.dart';

class ChooseCityBottomSheet extends StatefulWidget {
  final CityType cityType;
  final String? fromCityId;
  final String? title;

  const ChooseCityBottomSheet({
    required this.cityType,
    this.fromCityId,
    this.title,
    super.key,
  });

  @override
  State<ChooseCityBottomSheet> createState() => _ChooseCityBottomSheetState();
}

class _ChooseCityBottomSheetState extends State<ChooseCityBottomSheet> {
  late final DestinationBloc _destinationBloc;
  CityModel? _selectedCity;

  @override
  void initState() {
    super.initState();
    _destinationBloc = getIt<DestinationBloc>();
    _loadCities();
  }

  void _loadCities() {
    if (widget.cityType == CityType.from) {
      _destinationBloc.add(const LoadCitiesFromEvent());
    } else {
      _destinationBloc.add(
        LoadCitiesToEvent(fromCityId: widget.fromCityId ?? '1'),
      );
    }
  }

  String get _title {
    if (widget.title != null) return widget.title!;
    return widget.cityType == CityType.from ? 'Откуда' : 'Куда';
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _destinationBloc,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSpacing.radiusXL),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _title,
                      style: AppTypography.h5,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: const HeroIcon(
                      HeroIcons.xMark,
                      size: 24,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: BlocBuilder<DestinationBloc, DestinationState>(
                bloc: _destinationBloc,
                builder: (context, state) {
                  if (state is DestinationLoading) {
                    return const CityLoadingState();
                  }

                  if (state is DestinationError) {
                    return CityErrorState(
                      message: state.message,
                      onRetry: _loadCities,
                    );
                  }

                  List<CityModel> cities = [];
                  if (state is CitiesFromLoaded) {
                    cities = state.cities;
                  } else if (state is CitiesToLoaded) {
                    cities = state.cities;
                  } else if (state is AllCitiesLoaded) {
                    cities = state.cities;
                  }

                  if (cities.isEmpty) {
                    return const CityEmptyState();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.md,
                    ),
                    itemCount: cities.length,
                    itemBuilder: (context, index) {
                      final city = cities[index];
                      final isSelected = _selectedCity?.id == city.id;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: CityRadioOption(
                          cityName: city.name,
                          selected: isSelected,
                          onTap: () {
                            setState(() {
                              _selectedCity = city;
                            });
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSpacing.lg,
                right: AppSpacing.lg,
                top: AppSpacing.lg,
                bottom: 56,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedCity != null
                      ? () => Navigator.pop(context, _selectedCity)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.disabled,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.lg,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                    ),
                  ),
                  child: Text(
                    'Выбрать',
                    style: AppTypography.buttonLarge,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
