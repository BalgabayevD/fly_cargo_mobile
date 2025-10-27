import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/injection.dart';
import 'package:fly_cargo/shared/tariffs/data/models/tariff_models.dart';
import 'package:fly_cargo/shared/tariffs/domain/usecases/create_tariff_usecase.dart';
import 'package:fly_cargo/shared/tariffs/domain/usecases/get_tariff_categories_usecase.dart';

class CreateTariffPage extends StatefulWidget {
  const CreateTariffPage({super.key});

  @override
  State<CreateTariffPage> createState() => _CreateTariffPageState();
}

class _CreateTariffPageState extends State<CreateTariffPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imageController = TextEditingController();
  final _weightController = TextEditingController();
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _volumetricWeightController = TextEditingController();
  final _iconController = TextEditingController();

  int? _selectedCategoryId;
  int? _selectedPackageId;
  bool _isActive = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    _weightController.dispose();
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _volumetricWeightController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Создать тариф',
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Основная информация
              _buildSectionTitle('Основная информация'),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _nameController,
                label: 'Название тарифа',
                hint: 'Введите название тарифа',
                validator: (value) =>
                    value?.isEmpty == true ? 'Введите название' : null,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _descriptionController,
                label: 'Описание',
                hint: 'Введите описание тарифа',
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _imageController,
                label: 'URL изображения',
                hint: 'https://example.com/image.jpg',
              ),

              const SizedBox(height: 24),

              // Категория и пакет
              _buildSectionTitle('Категория и пакет'),
              const SizedBox(height: 16),

              _buildCategoryDropdown(),

              const SizedBox(height: 16),

              _buildPackageDropdown(),

              const SizedBox(height: 24),

              // Размеры и вес
              _buildSectionTitle('Размеры и вес'),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _weightController,
                      label: 'Вес (кг)',
                      hint: '0.0',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _volumetricWeightController,
                      label: 'Объемный вес (кг)',
                      hint: '0.0',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      controller: _lengthController,
                      label: 'Длина (см)',
                      hint: '0.0',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      controller: _widthController,
                      label: 'Ширина (см)',
                      hint: '0.0',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              _buildTextField(
                controller: _heightController,
                label: 'Высота (см)',
                hint: '0.0',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 24),

              // Дополнительные параметры
              _buildSectionTitle('Дополнительные параметры'),
              const SizedBox(height: 16),

              _buildTextField(
                controller: _iconController,
                label: 'Иконка (код)',
                hint: '59717',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              SwitchListTile(
                title: const Text('Активный тариф'),
                subtitle: const Text('Тариф будет доступен для выбора'),
                value: _isActive,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),

              const SizedBox(height: 32),

              // Кнопка создания
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _createTariff,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Создать тариф',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTypography.h5.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.gray50,
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return FutureBuilder<List<TariffCategoryModel>>(
      future: getIt<GetTariffCategoriesUseCase>()(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Text('Ошибка загрузки категорий');
        }

        final categories = snapshot.data!;

        return DropdownButtonFormField<int>(
          value: _selectedCategoryId,
          decoration: InputDecoration(
            labelText: 'Категория тарифа',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.gray50,
          ),
          items: categories.map((category) {
            return DropdownMenuItem<int>(
              value: category.id,
              child: Text(category.name),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategoryId = value;
            });
          },
          validator: (value) => value == null ? 'Выберите категорию' : null,
        );
      },
    );
  }

  Widget _buildPackageDropdown() {
    // TODO: Реализовать загрузку пакетов
    return DropdownButtonFormField<int>(
      value: _selectedPackageId,
      decoration: InputDecoration(
        labelText: 'Пакет',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.gray50,
      ),
      items: const [
        DropdownMenuItem<int>(value: 1, child: Text('Стандартный пакет')),
      ],
      onChanged: (value) {
        setState(() {
          _selectedPackageId = value;
        });
      },
      validator: (value) => value == null ? 'Выберите пакет' : null,
    );
  }

  Future<void> _createTariff() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final request = CreateTariffRequest(
        additionalCostForFragileCargo: 0.0,
        costPriceOfAirShipment: 0.0,
        description: _descriptionController.text,
        fields: const ['WEIGHT', 'HEIGHT', 'LENGTH', 'WIDTH'],
        height: double.tryParse(_heightController.text) ?? 0.0,
        icon: int.tryParse(_iconController.text) ?? 59717,
        image: _imageController.text,
        isActive: _isActive,
        length: double.tryParse(_lengthController.text) ?? 0.0,
        name: _nameController.text,
        packageId: _selectedPackageId ?? 1,
        sortIndex: 0,
        tariffCategoryId: _selectedCategoryId ?? 1,
        volumetricWeight:
            double.tryParse(_volumetricWeightController.text) ?? 0.0,
        weight: double.tryParse(_weightController.text) ?? 0.0,
        width: double.tryParse(_widthController.text) ?? 0.0,
      );

      final response = await getIt<CreateTariffUseCase>()(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message),
            backgroundColor: response.success
                ? AppColors.success
                : AppColors.error,
          ),
        );

        if (response.success) {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка создания тарифа: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
