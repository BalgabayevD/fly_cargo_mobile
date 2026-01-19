import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class TransportationRulesPage extends StatelessWidget {
  static const String path = '/transportation-rules';

  static String location() => Uri(path: path).toString();

  const TransportationRulesPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const TransportationRulesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: context.l10n.transportationRules,
      automaticallyImplyLeading: true,
      centerTitle: true,
      child: Markdown(
        data: _transportationRulesContent,
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

const String _transportationRulesContent = '''
# Правила перевозки

Настоящие правила определяют порядок приёма, перевозки и выдачи грузов службой доставки Sapsano.

## 1. Требования к грузам

### 1.1. Допустимые габариты и вес
- Максимальный вес одного места: **30 кг**
- Максимальные габариты: **100×60×60 см**
- Для негабаритных грузов требуется предварительное согласование

### 1.2. Требования к упаковке
- Груз должен быть упакован надлежащим образом
- Упаковка должна обеспечивать сохранность при транспортировке
- Хрупкие предметы должны иметь соответствующую маркировку

## 2. Запрещённые к перевозке грузы

**Категорически запрещается перевозить:**
- Оружие и боеприпасы
- Взрывчатые и легковоспламеняющиеся вещества
- Наркотические и психотропные вещества
- Ядовитые и радиоактивные материалы
- Скоропортящиеся продукты без специальной упаковки
- Живые животные
- Денежные средства и ценные бумаги
- Предметы, запрещённые законодательством РК

## 3. Приём груза

**3.1.** При приёме груза курьер проверяет:
- Соответствие груза описанию в заказе
- Целостность упаковки
- Отсутствие признаков запрещённых вложений

**3.2.** Отправитель обязан присутствовать при приёме груза и подтвердить передачу.

## 4. Сроки доставки

| Тип доставки | Срок |
|--------------|------|
| Экспресс | В тот же день |
| Стандарт | 1-2 рабочих дня |
| Эконом | 3-5 рабочих дней |

*Сроки могут быть увеличены в праздничные дни и при форс-мажорных обстоятельствах.*

## 5. Выдача груза

**5.1.** Груз выдаётся получателю при предъявлении:
- Документа, удостоверяющего личность
- Кода подтверждения из SMS

**5.2.** При получении груза получатель обязан:
- Проверить целостность упаковки
- Осмотреть содержимое в присутствии курьера
- Подтвердить получение в приложении

## 6. Страхование груза

**6.1.** Базовое страхование включено в стоимость доставки и покрывает:
- Утрату груза
- Повреждение при транспортировке

**6.2.** Максимальная сумма возмещения: **100 000 тенге**

**6.3.** Для грузов большей стоимости рекомендуется оформить дополнительное страхование.

## 7. Претензии

**7.1.** Претензии принимаются в течение **7 дней** с момента доставки.

**7.2.** Для подачи претензии необходимо:
- Описание проблемы
- Фото повреждений (при наличии)
- Номер заказа

**7.3.** Срок рассмотрения претензии: до **10 рабочих дней**.

## 8. Контакты

**Служба поддержки:**
- Email: support@sapsano.kz
- Телефон: +7 727 123-456
- Режим работы: круглосуточно

---

*Дата последнего обновления: январь 2026*
''';
