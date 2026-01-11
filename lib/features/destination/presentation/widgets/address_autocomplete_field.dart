import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/destination/domain/entities/address_entity.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/destination_bloc.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/destination_event.dart';
import 'package:fly_cargo/features/destination/presentation/widgets/address_autocomplete_overlay.dart';
import 'package:heroicons/heroicons.dart';

class AddressAutocompleteField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final String? cityName;
  final Function(AddressEntity)? onAddressSelected;

  const AddressAutocompleteField({
    required this.label,
    required this.controller,
    this.hintText,
    this.cityName,
    this.onAddressSelected,
    super.key,
  });

  @override
  State<AddressAutocompleteField> createState() =>
      _AddressAutocompleteFieldState();
}

class _AddressAutocompleteFieldState extends State<AddressAutocompleteField> {
  Timer? _debounceTimer;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late final DestinationBloc _destinationBloc;
  final FocusNode _focusNode = FocusNode();
  bool _isSettingAddress = false;
  @override
  void initState() {
    super.initState();
    _destinationBloc = context.read<DestinationBloc>();
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    widget.controller.removeListener(_onTextChanged);
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onTextChanged() {
    if (_isSettingAddress) return;

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      final query = widget.controller.text.trim();
      if (query.length >= 2 &&
          widget.cityName != null &&
          widget.cityName!.isNotEmpty) {
        _destinationBloc.add(
          SearchAddressesEvent(
            city: widget.cityName!,
            address: query,
          ),
        );
        _showOverlay();
      } else {
        _removeOverlay();
      }
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final size = renderBox?.size ?? Size.zero;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 4),
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
            color: AppColors.white,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
                border: Border.all(
                  color: AppColors.border,
                  width: AppSpacing.borderWidth,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: AddressAutocompleteOverlayContent(
                destinationBloc: _destinationBloc,
                onAddressSelected: (address) {
                  _debounceTimer?.cancel();

                  final addressText = address.fullAddress ?? address.address;

                  _isSettingAddress = true;

                  widget.controller.text = addressText;

                  _removeOverlay();

                  _focusNode.unfocus();

                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (mounted) {
                      _isSettingAddress = false;
                    }
                  });

                  if (widget.onAddressSelected != null) {
                    widget.onAddressSelected!(address);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: AppTypography.bodyMedium.copyWith(
        color: AppColors.surface5,
      ),
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        borderSide: BorderSide(
          color: AppColors.border,
          width: AppSpacing.borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        borderSide: BorderSide(
          color: AppColors.border,
          width: AppSpacing.borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: AppSpacing.borderWidthThick,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      suffixIcon: widget.controller.text.isNotEmpty
          ? IconButton(
              icon: HeroIcon(
                HeroIcons.xMark,
                size: 20,
                color: AppColors.surface4,
              ),
              onPressed: () {
                widget.controller.clear();
                _removeOverlay();
              },
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.surface4,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            onTap: () {
              if (widget.controller.text.trim().length >= 2 &&
                  widget.cityName != null &&
                  widget.cityName!.isNotEmpty) {
                _showOverlay();
              }
            },
            onTapOutside: (_) {
              _focusNode.unfocus();
              _removeOverlay();
            },
            onChanged: (_) {
            },
            decoration: _buildInputDecoration(),
            style: AppTypography.bodyLarge,
          ),
        ],
      ),
    );
  }
}
