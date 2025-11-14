import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/features/home/presentation/bloc/tariff_selection_bloc.dart';
import 'package:fly_cargo/features/home/presentation/widgets/select_box_button.dart';
import 'package:fly_cargo/features/home/presentation/widgets/tariff_selection_widget.dart';

mixin BoxSelectionSectionStyling {
  static const double spacing = 16.0;
  static const double buttonSpacing = 20.0;
  static const double padding = 16.0;
  static const double borderRadius = 12.0;
  static const double borderWidth = 1.0;
  static const double iconSize = 18.0;
  static const double containerSize = 32.0;
  static const double iconContainerBorderRadius = 8.0;
  static const double textSpacing = 12.0;
}

class BoxSelectionSectionWidget extends StatelessWidget
    with BoxSelectionSectionStyling {
  final void Function(BuildContext, String) onBoxDetailsTap;

  const BoxSelectionSectionWidget({super.key, required this.onBoxDetailsTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildBoxSelectionHeader(),
        const SizedBox(height: BoxSelectionSectionStyling.spacing),
        const TariffSelectionWidget(),
        BlocBuilder<TariffSelectionBloc, TariffSelectionState>(
          builder: (context, state) {
            if (state is TariffSelectionLoaded &&
                state.selectedTariffId != null) {
              return Column(
                children: [
                  const SizedBox(
                    height: BoxSelectionSectionStyling.buttonSpacing,
                  ),
                  SelectBoxButton(
                    onTap: () => onBoxDetailsTap(
                      context,
                      state.selectedTariffId.toString(),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _buildBoxSelectionHeader() {
    return Container(
      padding: const EdgeInsets.all(BoxSelectionSectionStyling.padding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(
          BoxSelectionSectionStyling.borderRadius,
        ),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
          width: BoxSelectionSectionStyling.borderWidth,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: BoxSelectionSectionStyling.containerSize,
            height: BoxSelectionSectionStyling.containerSize,
            decoration: const BoxDecoration(
              color: Color(0xFFFF9500),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  BoxSelectionSectionStyling.iconContainerBorderRadius,
                ),
              ),
            ),
            child: const Icon(
              Icons.inventory_2,
              color: Colors.white,
              size: BoxSelectionSectionStyling.iconSize,
            ),
          ),
          const SizedBox(width: BoxSelectionSectionStyling.textSpacing),
          const Expanded(
            child: Text(
              'Выберите коробку для упаковки',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
