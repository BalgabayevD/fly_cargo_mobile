import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

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

  Widget _buildOptionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.subtitleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressDetailsCard({
    required TextEditingController apartmentController,
    required TextEditingController entranceController,
    required TextEditingController floorController,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: _buildTextField(
                controller: apartmentController,
                label: 'Квартира',
                // icon: Icons.home_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextField(
                controller: entranceController,
                label: 'Подъезд',
                // icon: Icons.door_front_door_outlined,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextField(
                controller: floorController,
                label: 'Этаж',
                // icon: Icons.stairs_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    IconData? icon,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20, color: AppColors.textSecondary),
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
    );
  }

  Widget _buildTextAreaCard({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            prefixIcon: Icon(icon, size: 20, color: AppColors.textSecondary),
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
            alignLabelWithHint: true,
          ),
          maxLines: 3,
          onChanged: (_) => _notifyDataChanged(),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.h5.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок секции
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.settings, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Дополнительные опции',
                style: AppTypography.h5.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Флаги в красивом дизайне
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildOptionTile(
                  icon: Icons.warning_amber_rounded,
                  iconColor: Colors.orange,
                  title: 'Хрупкий груз',
                  subtitle: 'Требует особой осторожности при транспортировке',
                  value: _isFragile,
                  onChanged: (value) {
                    setState(() {
                      _isFragile = value ?? false;
                    });
                    _notifyDataChanged();
                  },
                ),
                Divider(height: 1, color: AppColors.borderLight),
                _buildOptionTile(
                  icon: Icons.build_circle_outlined,
                  iconColor: Colors.red,
                  title: 'Поврежденный груз',
                  subtitle: 'Имеет видимые повреждения или дефекты',
                  value: _isDefect,
                  onChanged: (value) {
                    setState(() {
                      _isDefect = value ?? false;
                    });
                    _notifyDataChanged();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Категория
          _buildSectionHeader(
            icon: Icons.category_outlined,
            title: 'Категория груза',
            subtitle: 'Выберите тип отправляемого груза',
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                value: _category,
                decoration: InputDecoration(
                  labelText: 'Выберите категорию',
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
                items: const [
                  DropdownMenuItem(value: 'Обычный', child: Text('Обычный')),
                  DropdownMenuItem(
                    value: 'Документы',
                    child: Text('Документы'),
                  ),
                  DropdownMenuItem(
                    value: 'Электроника',
                    child: Text('Электроника'),
                  ),
                  DropdownMenuItem(value: 'Одежда', child: Text('Одежда')),
                  DropdownMenuItem(value: 'Продукты', child: Text('Продукты')),
                ],
                onChanged: (value) {
                  setState(() {
                    _category = value ?? 'Обычный';
                  });
                  _notifyDataChanged();
                },
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Детали адреса отправки
          _buildSectionHeader(
            icon: Icons.location_on_outlined,
            title: 'Детали адреса отправки',
            subtitle: 'Укажите дополнительные детали для курьера',
          ),
          const SizedBox(height: 16),
          _buildAddressDetailsCard(
            apartmentController: _fromApartmentController,
            entranceController: _fromEntranceController,
            floorController: _fromFloorController,
          ),
          const SizedBox(height: 24),

          // Детали адреса доставки
          _buildSectionHeader(
            icon: Icons.location_on_outlined,
            title: 'Детали адреса доставки',
            subtitle: 'Укажите дополнительные детали для курьера',
          ),
          const SizedBox(height: 16),
          _buildAddressDetailsCard(
            apartmentController: _toApartmentController,
            entranceController: _toEntranceController,
            floorController: _toFloorController,
          ),
          const SizedBox(height: 24),

          // Комментарий
          _buildSectionHeader(
            icon: Icons.message_outlined,
            title: 'Комментарий для курьера',
            subtitle: 'Дополнительная информация для доставки',
          ),
          const SizedBox(height: 16),
          _buildTextAreaCard(
            controller: _commentController,
            label: 'Дополнительная информация для курьера',
            hint: 'Например: Позвонить за 10 минут, оставить у соседей',
            icon: Icons.message_outlined,
          ),
          const SizedBox(height: 24),

          // Описание груза
          _buildSectionHeader(
            icon: Icons.description_outlined,
            title: 'Описание груза',
            subtitle: 'Подробное описание содержимого посылки',
          ),
          const SizedBox(height: 16),
          _buildTextAreaCard(
            controller: _descriptionController,
            label: 'Подробное описание содержимого',
            hint:
                'Опишите что находится в посылке (например: книги, одежда, документы)',
            icon: Icons.description_outlined,
          ),
        ],
      ),
    );
  }
}

class OrderFormData {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final String description;
  final String fromApartment;
  final String fromEntrance;
  final String fromFloor;
  final String toApartment;
  final String toEntrance;
  final String toFloor;

  const OrderFormData({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.description,
    required this.fromApartment,
    required this.fromEntrance,
    required this.fromFloor,
    required this.toApartment,
    required this.toEntrance,
    required this.toFloor,
  });
}
