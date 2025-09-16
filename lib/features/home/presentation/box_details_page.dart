import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/di/service_locator.dart';
import 'package:fly_cargo/features/destination/models/address_model.dart';
import 'package:fly_cargo/features/home/presentation/order_confirmation_page.dart';
import 'package:fly_cargo/features/home/presentation/widgets/options_list_widget.dart';

class BoxDetailsPage extends StatelessWidget {
  final String boxType;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const BoxDetailsPage({
    super.key,
    required this.boxType,
    this.fromAddress,
    this.toAddress,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ServiceLocator().getBoxByTypeUseCase(boxType),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF333333),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: const Center(
              child: Text('Ошибка загрузки информации о коробке'),
            ),
          );
        }

        final box = snapshot.data!;
        return BoxDetailsContent(
          box: box,
          fromAddress: fromAddress,
          toAddress: toAddress,
        );
      },
    );
  }
}

class BoxDetailsContent extends StatelessWidget {
  final dynamic box;
  final AddressModel? fromAddress;
  final AddressModel? toAddress;

  const BoxDetailsContent({
    super.key,
    required this.box,
    this.fromAddress,
    this.toAddress,
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
        title: Text(box.name, style: AppTypography.h5),
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
                    box.imagePath,
                    fit: BoxFit.contain,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Название коробки
            Text(box.name, style: AppTypography.h3),
            SizedBox(height: AppSpacing.sm),

            // Размеры коробки
            Text(
              'Размеры: ${box.dimensions}',
              style: AppTypography.subtitleLarge,
            ),
            const SizedBox(height: 20),

            // Описание
            AppCardWithTitle(
              title: 'Описание',
              variant: AppCardVariant.filled,
              child: Text(
                box.description,
                style: AppTypography.bodyMedium.copyWith(
                  height: AppTypography.lineHeightRelaxed,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Цена
            AppPriceCard(
              title: 'Стоимость доставки',
              price: 'от ${box.basePrice.toInt()} ${box.currency}',
              isFullWidth: true,
            ),
            const SizedBox(height: 30),

            // Дополнительные опции
            const OptionsListWidget(),

            const SizedBox(height: 30),

            // Кнопка подтверждения
            AppButton(
              text: 'Подтвердить выбор',
              onPressed: () {
                if (fromAddress != null && toAddress != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationPage(
                        box: box,
                        fromAddress: fromAddress!,
                        toAddress: toAddress!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Сначала укажите адреса отправки и доставки',
                      ),
                      backgroundColor: Color(0xFFFF3B30),
                    ),
                  );
                }
              },
              size: AppButtonSize.extraLarge,
              variant: AppButtonVariant.primary,
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }
}
