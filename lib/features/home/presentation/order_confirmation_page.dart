import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/shared/destination/data/models/destination_models.dart';

class OrderConfirmationPage extends StatelessWidget {
  final dynamic box;
  final AddressModel fromAddress;
  final AddressModel toAddress;
  final Map<String, String>? recipientData;
  final String? cargoDescription;
  final List<String>? photos;

  const OrderConfirmationPage({
    super.key,
    required this.box,
    required this.fromAddress,
    required this.toAddress,
    this.recipientData,
    this.cargoDescription,
    this.photos,
  });

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
          'Подтверждение заказа',
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
            // Заголовок
            const Text(
              'Проверьте данные заказа',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Убедитесь, что все данные указаны корректно',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
            const SizedBox(height: 30),

            // Информация о коробке
            AppCardWithTitle(
              title: 'Упаковка',
              variant: AppCardVariant.filled,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            box.imagePath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              box.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Размеры: ${box.dimensions}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF666666),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'от ${box.basePrice.toInt()} ${box.currency}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF007AFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Адреса доставки
            AppCardWithTitle(
              title: 'Маршрут доставки',
              variant: AppCardVariant.filled,
              child: Column(
                children: [
                  // Адрес отправки
                  _buildAddressItem(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFF007AFF),
                    title: 'Откуда забрать',
                    city: fromAddress.city,
                    address: fromAddress.address,
                  ),
                  const SizedBox(height: 16),
                  // Стрелка
                  const Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFF666666),
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Адрес доставки
                  _buildAddressItem(
                    icon: Icons.location_on,
                    iconColor: const Color(0xFF34C759),
                    title: 'Куда доставить',
                    city: toAddress.city,
                    address: toAddress.address,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Данные получателя
            if (recipientData != null) ...[
              AppCardWithTitle(
                title: 'Получатель',
                variant: AppCardVariant.filled,
                child: Column(
                  children: [
                    _buildInfoRow(
                      icon: Icons.person,
                      label: 'Имя',
                      value: recipientData!['name'] ?? '',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.phone,
                      label: 'Телефон',
                      value: recipientData!['phone'] ?? '',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Описание груза
            if (cargoDescription != null && cargoDescription!.isNotEmpty) ...[
              AppCardWithTitle(
                title: 'Описание груза',
                variant: AppCardVariant.filled,
                child: Text(
                  cargoDescription!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF333333),
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Фотографии
            if (photos != null && photos!.isNotEmpty) ...[
              AppCardWithTitle(
                title: 'Фотографии',
                variant: AppCardVariant.filled,
                child: Text(
                  'Добавлено фотографий: ${photos!.length}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            // Стоимость
            AppPriceCard(
              title: 'Итого к оплате',
              price: 'от ${box.basePrice.toInt()} ${box.currency}',
              subtitle:
                  'Окончательная стоимость будет рассчитана после оценки груза',
              isFullWidth: true,
            ),
            const SizedBox(height: 30),

            // Кнопки действий
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Отменить заказ',
                    onPressed: () => _showCancelDialog(context),
                    size: AppButtonSize.large,
                    variant: AppButtonVariant.outline,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: 'Подтвердить заказ',
                    onPressed: () => _confirmOrder(context),
                    size: AppButtonSize.large,
                    variant: AppButtonVariant.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String city,
    required String address,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                city,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                address,
                style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF666666)),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Отменить заказ?'),
        content: const Text(
          'Вы уверены, что хотите отменить заказ? Все введенные данные будут потеряны.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Нет'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Закрыть диалог
              Navigator.pop(context); // Вернуться на главную
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Заказ отменен'),
                  backgroundColor: Color(0xFFFF3B30),
                ),
              );
            },
            child: const Text(
              'Да, отменить',
              style: TextStyle(color: Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmOrder(BuildContext context) {
    // Здесь будет логика подтверждения заказа
    Navigator.pop(context); // Вернуться на главную
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Заказ успешно оформлен!'),
        backgroundColor: Color(0xFF34C759),
      ),
    );
  }
}
