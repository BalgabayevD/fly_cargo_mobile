import 'package:flutter/material.dart';
import 'package:fly_cargo/features/home/presentation/widgets/options_list_widget.dart';

class BoxDetailsPage extends StatelessWidget {
  final String boxType;

  const BoxDetailsPage({super.key, required this.boxType});

  @override
  Widget build(BuildContext context) {
    final boxInfo = _getBoxInfo(boxType);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF333333)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          boxInfo['title']!,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение коробки
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    boxInfo['imagePath']!,
                    fit: BoxFit.contain,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Название коробки
            Text(
              boxInfo['title']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),

            // Размеры коробки
            Text(
              'Размеры: ${boxInfo['dimensions']!}',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF666666),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Описание
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE9ECEF)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Описание',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    boxInfo['description']!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Цена
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF007AFF).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF007AFF).withOpacity(0.3),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Стоимость доставки',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    boxInfo['price']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF007AFF),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Дополнительные опции
            const OptionsListWidget(),

            const SizedBox(height: 30),

            // Кнопка подтверждения
            GestureDetector(
              onTap: () {
                // Здесь можно добавить логику подтверждения выбора
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Выбрана ${boxInfo['title']}'),
                    backgroundColor: const Color(0xFF34C759),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF007AFF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Подтвердить выбор',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String> _getBoxInfo(String boxType) {
    switch (boxType) {
      case 'small':
        return {
          'title': 'Маленькая коробка',
          'dimensions': '15 × 10 × 20 см',
          'description':
              'Идеально подходит для небольших предметов: документы, книги, небольшие сувениры, косметика. Компактный размер обеспечивает экономичную доставку.',
          'imagePath': 'assets/images/small.png',
          'price': 'от 3 500 ₸',
        };
      case 'medium':
        return {
          'title': 'Средняя коробка',
          'dimensions': '20 × 20 × 30 см',
          'description':
              'Универсальный размер для большинства посылок: одежда, обувь, электроника, бытовая техника. Оптимальное соотношение размера и стоимости.',
          'imagePath': 'assets/images/medium.png',
          'price': 'от 5 500 ₸',
        };
      case 'big':
        return {
          'title': 'Большая коробка',
          'dimensions': '30 × 30 × 40 см',
          'description':
              'Для крупных и объемных предметов: крупная бытовая техника, мебель, спортивный инвентарь. Максимальная вместимость для ваших посылок.',
          'imagePath': 'assets/images/big.png',
          'price': 'от 8 500 ₸',
        };
      default:
        return {
          'title': 'Коробка',
          'dimensions': 'Неизвестно',
          'description': 'Описание недоступно',
          'imagePath': 'assets/images/medium.png',
          'price': 'Цена не указана',
        };
    }
  }
}
