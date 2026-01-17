import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_cargo/core/design_system/components/button.dart';
import 'package:fly_cargo/core/design_system/components/form_input.dart';
import 'package:fly_cargo/core/design_system/components/space.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:fly_cargo/features/create_order/data/models/pre_create_order_response.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/ai_analysis_indicator.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/analysis_status_message.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/create_order/photo_grid_section.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_location.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_recipient.dart';
import 'package:fly_cargo/features/create_order/presentation/widgets/select_tariffs.dart';
import 'package:fly_cargo/features/destination/data/models/destination_models.dart';
import 'package:fly_cargo/features/destination/presentation/bloc/cities_bloc.dart';

class HomePageContentV2 extends StatelessWidget {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final String? recipientName;
  final String? recipientPhone;
  final double? tariffWeight;
  final String? description;
  final List<File> photos;

  final VoidCallback? onWeightTap;
  final VoidCallback? onSubmitOrder;
  final bool isAnalyzing;
  final bool isAnalysisCompleted;
  final AnalysisStatus? analysisStatus;

  const HomePageContentV2({
    required this.fromAddress,
    required this.toAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.tariffWeight,
    required this.description,
    required this.photos,
    this.onWeightTap,
    this.onSubmitOrder,
    this.isAnalyzing = false,
    this.isAnalysisCompleted = false,
    this.analysisStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        PhotoGridSection(),
        const SizedBox(height: AppSpacing.md),
        _AnalysisSection(
          isAnalyzing: isAnalyzing,
          isAnalysisCompleted: isAnalysisCompleted,
          analysisStatus: analysisStatus,
          hasPhotos: photos.isNotEmpty,
        ),
        const SizedBox(height: AppSpacing.lg),
        _OrderFieldsSection(
          fromAddress: fromAddress,
          toAddress: toAddress,
          recipientName: recipientName,
          recipientPhone: recipientPhone,
          tariffWeight: tariffWeight,
          description: description,
          onWeightTap: onWeightTap,
        ),
        const SizedBox(height: AppSpacing.xl),
        BeButton(
          text: context.l10n.createOrder,
          color: .primary,
          onPressed: onSubmitOrder,
        ),
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}

class _AnalysisSection extends StatelessWidget {
  final bool isAnalyzing;
  final bool isAnalysisCompleted;
  final AnalysisStatus? analysisStatus;
  final bool hasPhotos;

  const _AnalysisSection({
    required this.isAnalyzing,
    required this.isAnalysisCompleted,
    required this.analysisStatus,
    required this.hasPhotos,
  });

  @override
  Widget build(BuildContext context) {
    if (isAnalyzing) {
      return const AIAnalysisIndicator();
    }

    if (!isAnalysisCompleted && !hasPhotos) {
      return const SizedBox.shrink();
    }

    if (isAnalysisCompleted && analysisStatus != null) {
      return AnalysisStatusMessage(status: analysisStatus!);
    }

    return const SizedBox.shrink();
  }
}

class _OrderFieldsSection extends StatelessWidget {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final String? recipientName;
  final String? recipientPhone;
  final double? tariffWeight;
  final String? description;
  final VoidCallback? onWeightTap;

  const _OrderFieldsSection({
    required this.fromAddress,
    required this.toAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.tariffWeight,
    required this.description,
    required this.onWeightTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CitiesBloc>(
      create: (BuildContext context) =>
          getIt<CitiesBloc>()..add(LoadInitialCitiesEvent()),
      child: Column(
        children: [
          SelectLocation(type: .from),
          BeSpace(size: .md),
          SelectLocation(type: .to),
          BeSpace(size: .md),
          SelectRecipient(),
          BeSpace(size: .xxxl),
          SelectTariffs(),
          BeSpace(size: .md),
          BeFormInput(
            keyboardType: .numberWithOptions(decimal: true),
            label: context.l10n.weightInKg,
          ),
          BeSpace(size: .md),
          BeFormInput(
            label: context.l10n.description,
          ),
        ],
      ),
    );
  }
}
