import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/features/home/presentation/widgets/delivery_date_widget.dart';
import 'package:fly_cargo/features/home/presentation/widgets/info_link_text.dart';
import 'package:fly_cargo/features/home/presentation/widgets/order_field_card.dart';
import 'package:fly_cargo/features/home/presentation/widgets/photo_list_item.dart';
import 'package:fly_cargo/features/home/presentation/widgets/photo_upload_card.dart';
import 'package:fly_cargo/features/home/presentation/widgets/radio_option_card.dart';
import 'package:fly_cargo/features/home/presentation/widgets/submit_order_button.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

class HomePageContent extends StatelessWidget {
  final AddressModel? fromAddress;
  final AddressModel? toAddress;
  final String? recipientName;
  final String? recipientPhone;
  final String? tariffName;
  final double? tariffWeight;
  final String? description;
  final bool isExpressDelivery;
  final bool isFragile;
  final List<File> photos;
  final List<File> contentPhotos;
  final DateTime? deliveryDate;
  final double? calculatedPrice;
  final VoidCallback onFromAddressSelection;
  final VoidCallback onToAddressSelection;
  final VoidCallback onRecipientForm;
  final VoidCallback onTariffSelection;
  final VoidCallback onDescriptionForm;
  final VoidCallback onToggleExpress;
  final VoidCallback onToggleFragile;
  final VoidCallback onPickPhoto;
  final VoidCallback onPickContentPhoto;
  final Function(File) onRemovePhoto;
  final Function(File) onRemoveContentPhoto;
  final VoidCallback onSubmitOrder;
  final VoidCallback onInfoLink;

  const HomePageContent({
    required this.fromAddress,
    required this.toAddress,
    required this.recipientName,
    required this.recipientPhone,
    required this.tariffName,
    required this.tariffWeight,
    required this.description,
    required this.isExpressDelivery,
    required this.isFragile,
    required this.photos,
    required this.contentPhotos,
    required this.deliveryDate,
    required this.calculatedPrice,
    required this.onFromAddressSelection,
    required this.onToAddressSelection,
    required this.onRecipientForm,
    required this.onTariffSelection,
    required this.onDescriptionForm,
    required this.onToggleExpress,
    required this.onToggleFragile,
    required this.onPickPhoto,
    required this.onPickContentPhoto,
    required this.onRemovePhoto,
    required this.onRemoveContentPhoto,
    required this.onSubmitOrder,
    required this.onInfoLink,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        children: [
          OrderFieldCard(
            label: 'Откуда',
            value: fromAddress?.fullAddress ?? 'Укажите адрес отправки',
            onTap: onFromAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCard(
            label: 'Куда',
            value: toAddress?.fullAddress ?? 'Укажите адрес доставки',
            onTap: onToAddressSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCard(
            label: 'Получатель',
            value: recipientName != null && recipientPhone != null
                ? '$recipientName, $recipientPhone'
                : 'Укажите данные получателя',
            onTap: onRecipientForm,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCard(
            label: 'Тариф',
            value: tariffName ?? 'Выберите тариф',
            onTap: onTariffSelection,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCard(
            label: 'Вес, в кг',
            value: tariffWeight != null
                ? tariffWeight!.toStringAsFixed(1)
                : 'Выберите тариф',
            showChevron: false,
          ),
          const SizedBox(height: AppSpacing.md),
          OrderFieldCard(
            label: 'Описание',
            value: description ?? 'Опишите содержимое',
            onTap: onDescriptionForm,
          ),
          const SizedBox(height: AppSpacing.md),
          RadioOptionCard(
            label: 'Быстрая доставка',
            selected: isExpressDelivery,
            onTap: onToggleExpress,
          ),
          const SizedBox(height: AppSpacing.md),
          RadioOptionCard(
            label: 'Хрупкий груз',
            selected: isFragile,
            onTap: onToggleFragile,
          ),
          const SizedBox(height: AppSpacing.md),
          PhotoUploadCard(
            label: 'Добавить фото',
            onTap: onPickPhoto,
          ),
          if (photos.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            ...photos.asMap().entries.map((entry) {
              final index = entry.key;
              final photo = entry.value;
              return PhotoListItem(
                photoName: 'Фото ${index + 1}',
                onDelete: () => onRemovePhoto(photo),
              );
            }),
          ],
          const SizedBox(height: AppSpacing.md),
          PhotoUploadCard(
            label: 'Добавить фото содержимого',
            onTap: onPickContentPhoto,
          ),
          if (contentPhotos.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.sm),
            ...contentPhotos.asMap().entries.map((entry) {
              final index = entry.key;
              final photo = entry.value;
              return PhotoListItem(
                photoName: 'Фото содержимого ${index + 1}',
                onDelete: () => onRemoveContentPhoto(photo),
              );
            }),
          ],
          const SizedBox(height: AppSpacing.md),
          DeliveryDateWidget(deliveryDate: deliveryDate),
          const SizedBox(height: AppSpacing.xl),
          SubmitOrderButton(
            price: calculatedPrice ?? 2400,
            onPressed: onSubmitOrder,
          ),
          const SizedBox(height: AppSpacing.md),
          InfoLinkText(
            text: 'Узнать какие товары разрешены',
            onTap: onInfoLink,
          ),
        ],
      ),
    );
  }
}
