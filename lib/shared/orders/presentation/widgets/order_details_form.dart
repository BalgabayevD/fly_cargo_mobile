import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/shared/auth/presentation/pages/phone_input_page.dart';
import 'package:fly_cargo/shared/orders/domain/usecases/upload_order_photo_usecase.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_address_details_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_category_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_comment_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_description_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_options_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_section_header.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/photo_upload_widget.dart';

class OrderDetailsForm extends StatefulWidget {
  final Function(OrderFormData) onDataChanged;
  final GlobalKey<FormState>? formKey;

  const OrderDetailsForm({
    super.key,
    required this.onDataChanged,
    this.formKey,
  });

  @override
  State<OrderDetailsForm> createState() => _OrderDetailsFormState();
}

class _OrderDetailsFormState extends State<OrderDetailsForm> {
  late final GlobalKey<FormState> _formKey;

  final _fromApartmentController = TextEditingController();
  final _fromEntranceController = TextEditingController();
  final _fromFloorController = TextEditingController();
  final _toApartmentController = TextEditingController();
  final _toEntranceController = TextEditingController();
  final _toFloorController = TextEditingController();
  final _toNameController = TextEditingController();
  final _toPhoneController = TextEditingController();
  final _commentController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isDefect = false;
  bool _isFragile = false;
  String _category = 'Обычный';
  List<File> _contentPhotos = [];
  Map<File, String> _contentPhotoIds = {};
  late final UploadOrderPhotoUseCase _uploadOrderPhotoUseCase;

  @override
  void initState() {
    super.initState();
    _formKey = widget.formKey ?? GlobalKey<FormState>();
    _uploadOrderPhotoUseCase = getIt<UploadOrderPhotoUseCase>();
  }

  @override
  void dispose() {
    _fromApartmentController.dispose();
    _fromEntranceController.dispose();
    _fromFloorController.dispose();
    _toApartmentController.dispose();
    _toEntranceController.dispose();
    _toFloorController.dispose();
    _toNameController.dispose();
    _toPhoneController.dispose();
    _commentController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _notifyDataChanged() {
    final data = OrderFormData(
      isDefect: _isDefect,
      isFragile: _isFragile,
      category: _category,
      comment: _commentController.text,
      description: _descriptionController.text,
      fromApartment: _fromApartmentController.text,
      fromEntrance: _fromEntranceController.text,
      fromFloor: _fromFloorController.text,
      toApartment: _toApartmentController.text,
      toEntrance: _toEntranceController.text,
      toFloor: _toFloorController.text,
      toName: _toNameController.text,
      toPhone: _toPhoneController.text,
      contentPhotos: _contentPhotos,
      contentPhotoIds: _contentPhotoIds.values.toList(),
    );
    widget.onDataChanged(data);
  }

  Future<void> _handlePhotosChanged(List<File> photos) async {
    final previousPhotos = Set<File>.from(_contentPhotos);
    final newPhotos = Set<File>.from(photos);
    
    final addedPhotos = newPhotos.difference(previousPhotos);
    final removedPhotos = previousPhotos.difference(newPhotos);

    for (final photo in removedPhotos) {
      _contentPhotoIds.remove(photo);
    }

    setState(() {
      _contentPhotos = photos;
    });

    for (final photo in addedPhotos) {
      try {
        final photoId = await _uploadOrderPhotoUseCase(photo);
        setState(() {
          _contentPhotoIds[photo] = photoId;
        });
        _notifyDataChanged();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка при загрузке фото: $e'),
              backgroundColor: AppColors.error,
            ),
          );
        }
        setState(() {
          _contentPhotos.remove(photo);
        });
      }
    }

    _notifyDataChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderOptionsSection(
            isDefect: _isDefect,
            isFragile: _isFragile,
            onDefectChanged: (value) {
              setState(() {
                _isDefect = value;
              });
              _notifyDataChanged();
            },
            onFragileChanged: (value) {
              setState(() {
                _isFragile = value;
              });
              _notifyDataChanged();
            },
          ),
          const SizedBox(height: 24),

          OrderCategorySection(
            category: _category,
            onCategoryChanged: (value) {
              setState(() {
                _category = value;
              });
              _notifyDataChanged();
            },
          ),
          const SizedBox(height: 24),

          OrderAddressDetailsSection(
            title: 'Детали адреса отправки',
            subtitle: 'Укажите дополнительные детали для курьера',
            apartmentController: _fromApartmentController,
            entranceController: _fromEntranceController,
            floorController: _fromFloorController,
            onDataChanged: _notifyDataChanged,
          ),
          const SizedBox(height: 24),

          OrderAddressDetailsSection(
            title: 'Детали адреса доставки',
            subtitle: 'Укажите дополнительные детали для курьера',
            apartmentController: _toApartmentController,
            entranceController: _toEntranceController,
            floorController: _toFloorController,
            onDataChanged: _notifyDataChanged,
          ),
          const SizedBox(height: 24),

          // Данные получателя
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderSectionHeader(
                icon: Icons.person_outline,
                title: 'Данные получателя',
                subtitle: 'Укажите имя и телефон получателя',
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _toNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите имя получателя';
                  }
                  if (value.trim().length < 2) {
                    return 'Имя должно содержать минимум 2 символа';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Имя получателя *',
                  hintText: 'Введите имя получателя',
                  prefixIcon: Icon(Icons.person, size: 20, color: AppColors.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceVariant,
                ),
                onChanged: (_) => _notifyDataChanged(),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _toPhoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  PhoneNumberFormatter(),
                  LengthLimitingTextInputFormatter(18),
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите номер телефона';
                  }
                  final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');
                  if (digitsOnly.length < 10) {
                    return 'Введите корректный номер телефона';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Телефон получателя *',
                  hintText: '+7 (XXX) XXX-XX-XX',
                  prefixIcon: Icon(Icons.phone, size: 20, color: AppColors.textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.borderLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceVariant,
                ),
                onChanged: (_) => _notifyDataChanged(),
              ),
            ],
          ),
          const SizedBox(height: 24),

          OrderCommentSection(
            controller: _commentController,
            onDataChanged: _notifyDataChanged,
          ),
          const SizedBox(height: 24),

          OrderDescriptionSection(
            controller: _descriptionController,
            onDataChanged: _notifyDataChanged,
          ),
          const SizedBox(height: 24),

          PhotoUploadWidget(
            photos: _contentPhotos,
            onPhotosChanged: _handlePhotosChanged,
          ),
        ],
      ),
    );
  }
}
