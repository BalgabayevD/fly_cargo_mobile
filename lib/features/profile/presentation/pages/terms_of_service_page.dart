import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class TermsOfServicePage extends StatelessWidget {
  static const String path = '/terms-of-service';

  static String location() => Uri(path: path).toString();

  const TermsOfServicePage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const TermsOfServicePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: context.l10n.termsOfServiceTitle,
      automaticallyImplyLeading: true,
      backgroundColor: BeColors.white,
      centerTitle: true,
      child: Markdown(
        data: _termsOfServiceContent,
        padding: const EdgeInsets.all(AppSpacing.lg),
        styleSheet: MarkdownStyleSheet(
          h1: AppTypography.h3,
          h2: AppTypography.h4,
          h3: AppTypography.h5,
          p: AppTypography.bodyLarge.copyWith(height: 1.6),
          listBullet: AppTypography.bodyLarge,
        ),
      ),
    );
  }
}

const String _termsOfServiceContent = '''
# Условия оферты

Настоящий документ является публичной офертой ТОО «Sapsano» (далее — Исполнитель) и содержит условия предоставления услуг по доставке грузов.

## 1. Общие положения

**1.1.** Настоящая оферта определяет порядок и условия оказания услуг по доставке грузов посредством мобильного приложения Sapsano.

**1.2.** Акцептом настоящей оферты является регистрация в приложении и/или оформление заказа на доставку.

**1.3.** Исполнитель оставляет за собой право вносить изменения в условия оферты без предварительного уведомления Заказчика.

## 2. Предмет оферты

**2.1.** Исполнитель обязуется оказать услуги по доставке грузов, а Заказчик обязуется оплатить эти услуги в порядке и на условиях, предусмотренных настоящей офертой.

**2.2.** Перечень услуг и их стоимость определяются в приложении при оформлении заказа.

## 3. Права и обязанности сторон

### 3.1. Исполнитель обязуется:
- Доставить груз в указанные сроки
- Обеспечить сохранность груза
- Информировать Заказчика о статусе доставки
- Предоставить документы, подтверждающие доставку

### 3.2. Заказчик обязуется:
- Предоставить достоверную информацию о грузе
- Обеспечить надлежащую упаковку груза
- Своевременно оплатить услуги
- Обеспечить приём груза в указанном месте

## 4. Стоимость услуг и порядок оплаты

**4.1.** Стоимость услуг рассчитывается автоматически при оформлении заказа и зависит от:
- Веса и габаритов груза
- Расстояния доставки
- Срочности доставки
- Дополнительных услуг

**4.2.** Оплата производится через приложение с использованием банковской карты или иных доступных способов оплаты.

## 5. Ответственность сторон

**5.1.** Исполнитель несёт ответственность за сохранность груза с момента его принятия до момента передачи получателю.

**5.2.** Исполнитель не несёт ответственности за:
- Задержки, вызванные форс-мажорными обстоятельствами
- Повреждения, вызванные ненадлежащей упаковкой
- Содержимое груза, не соответствующее описанию

**5.3.** Максимальный размер компенсации определяется объявленной стоимостью груза.

## 6. Порядок разрешения споров

**6.1.** Все споры решаются путём переговоров.

**6.2.** При невозможности достижения соглашения споры рассматриваются в соответствии с законодательством Республики Казахстан.

## 7. Контактная информация

По всем вопросам обращайтесь:
- Email: support@sapsano.kz
- Телефон: +7 727 123-456

---

*Дата последнего обновления: январь 2026*
''';
