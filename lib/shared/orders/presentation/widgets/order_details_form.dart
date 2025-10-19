import 'package:flutter/material.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_address_details_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_category_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_comment_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_description_section.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_form_data.dart';
import 'package:fly_cargo/shared/orders/presentation/widgets/order_options_section.dart';

class OrderDetailsForm extends StatefulWidget {
  final Function(OrderFormData) onDataChanged;

  const OrderDetailsForm({super.key, required this.onDataChanged});

  @override
  State<OrderDetailsForm> createState() => _OrderDetailsFormState();
}

class _OrderDetailsFormState extends State<OrderDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _fromApartmentController = TextEditingController();
  final _fromEntranceController = TextEditingController();
  final _fromFloorController = TextEditingController();
  final _toApartmentController = TextEditingController();
  final _toEntranceController = TextEditingController();
  final _toFloorController = TextEditingController();
  final _commentController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isDefect = false;
  bool _isFragile = false;
  String _category = 'Обычный';

  @override
  void dispose() {
    _fromApartmentController.dispose();
    _fromEntranceController.dispose();
    _fromFloorController.dispose();
    _toApartmentController.dispose();
    _toEntranceController.dispose();
    _toFloorController.dispose();
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
    );
    widget.onDataChanged(data);
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

          OrderCommentSection(
            controller: _commentController,
            onDataChanged: _notifyDataChanged,
          ),
          const SizedBox(height: 24),

          OrderDescriptionSection(
            controller: _descriptionController,
            onDataChanged: _notifyDataChanged,
          ),
        ],
      ),
    );
  }
}
