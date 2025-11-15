import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class UserCostCalculatorPage extends StatefulWidget {
  const UserCostCalculatorPage({super.key});

  @override
  State<UserCostCalculatorPage> createState() => _UserCostCalculatorPageState();
}

class _UserCostCalculatorPageState extends State<UserCostCalculatorPage> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _dimensionsController = TextEditingController();

  String _selectedServiceType = 'standard';
  String _selectedUrgency = 'normal';
  double _calculatedCost = 0.0;
  bool _isCalculating = false;

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _weightController.dispose();
    _dimensionsController.dispose();
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
          'Калькулятор стоимости',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildCalculatorForm(),
            const SizedBox(height: 20),


            if (_calculatedCost > 0) _buildCalculationResult(),
            const SizedBox(height: 20),


            AppButton(
              text: _isCalculating ? 'Рассчитываем...' : 'Рассчитать стоимость',
              onPressed: _isCalculating ? null : _calculateCost,
              size: AppButtonSize.large,
              variant: AppButtonVariant.primary,
              isFullWidth: true,
              isLoading: _isCalculating,
            ),
            const SizedBox(height: 20),


            _buildTariffInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorForm() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Параметры доставки',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 20),


          _buildTextField(
            controller: _fromController,
            label: 'Откуда',
            hint: 'Введите адрес отправления',
            icon: Icons.location_on,
          ),
          const SizedBox(height: 16),

          _buildTextField(
            controller: _toController,
            label: 'Куда',
            hint: 'Введите адрес получения',
            icon: Icons.location_on,
          ),
          const SizedBox(height: 20),


          _buildServiceTypeSelector(),
          const SizedBox(height: 20),


          _buildUrgencySelector(),
          const SizedBox(height: 20),


          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _weightController,
                  label: 'Вес (кг)',
                  hint: '0.5',
                  icon: Icons.fitness_center,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  controller: _dimensionsController,
                  label: 'Габариты (см)',
                  hint: '30x20x10',
                  icon: Icons.straighten,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF666666)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
      ),
    );
  }

  Widget _buildServiceTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Тип услуги',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildServiceTypeOption(
                'standard',
                'Стандартная',
                'Документы, небольшие посылки',
                Icons.description,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildServiceTypeOption(
                'express',
                'Экспресс',
                'Быстрая доставка',
                Icons.flash_on,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceTypeOption(
    String value,
    String title,
    String subtitle,
    IconData icon,
  ) {
    final isSelected = _selectedServiceType == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedServiceType = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF007AFF).withValues(alpha: 0.1)
              : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF007AFF)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF007AFF)
                  : const Color(0xFF666666),
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUrgencySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Срочность',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildUrgencyOption('normal', 'Обычная', '1-2 дня'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildUrgencyOption('urgent', 'Срочная', 'В тот же день'),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildUrgencyOption(
                'super_urgent',
                'Супер срочная',
                '2-4 часа',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUrgencyOption(String value, String title, String subtitle) {
    final isSelected = _selectedUrgency == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUrgency = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF007AFF).withValues(alpha: 0.1)
              : const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF007AFF)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? const Color(0xFF007AFF)
                    : const Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 10, color: Color(0xFF666666)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculationResult() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Расчетная стоимость',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Итого:',
                style: TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
              Text(
                '${_calculatedCost.toStringAsFixed(0)} ₸',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF007AFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF34C759).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Color(0xFF34C759),
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Цена может измениться в зависимости от точного веса и габаритов',
                    style: TextStyle(fontSize: 12, color: Color(0xFF34C759)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTariffInfo() {
    return AppCard(
      variant: AppCardVariant.outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Тарифы',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 16),
          _buildTariffItem('Стандартная доставка', 'от 500 ₸'),
          _buildTariffItem('Экспресс доставка', 'от 1000 ₸'),
          _buildTariffItem('Срочная доставка', '+50% к тарифу'),
          _buildTariffItem('Супер срочная', '+100% к тарифу'),
          _buildTariffItem('Доплата за вес >1кг', '100 ₸/кг'),
          _buildTariffItem('Междугородняя доставка', 'от 2000 ₸'),
        ],
      ),
    );
  }

  Widget _buildTariffItem(String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Color(0xFF333333)),
          ),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF007AFF),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _calculateCost() async {
    if (_fromController.text.isEmpty || _toController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Пожалуйста, заполните адреса отправления и получения'),
          backgroundColor: Color(0xFFFF3B30),
        ),
      );
      return;
    }

    setState(() {
      _isCalculating = true;
    });


    await Future.delayed(const Duration(seconds: 2));


    double baseCost = 500.0;


    if (_selectedServiceType == 'express') {
      baseCost += 500.0;
    }


    switch (_selectedUrgency) {
      case 'urgent':
        baseCost *= 1.5;
        break;
      case 'super_urgent':
        baseCost *= 2.0;
        break;
    }


    final weight = double.tryParse(_weightController.text) ?? 0.5;
    if (weight > 1.0) {
      baseCost += (weight - 1.0) * 100.0;
    }

    setState(() {
      _calculatedCost = baseCost;
      _isCalculating = false;
    });
  }
}
