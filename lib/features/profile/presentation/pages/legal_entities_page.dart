import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class LegalEntitiesPage extends StatelessWidget {
  static const String path = '/legal-entities';

  static String location() => Uri(path: path).toString();

  const LegalEntitiesPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const LegalEntitiesPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: context.l10n.forLegalEntities,
      automaticallyImplyLeading: true,
      centerTitle: true,
      child: Markdown(
        data: _legalEntitiesContent,
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

const String _legalEntitiesContent = '''
# Для юридических лиц

Sapsano предлагает специальные условия сотрудничества для юридических лиц и индивидуальных предпринимателей.

## 1. Преимущества корпоративного обслуживания

- **Индивидуальные тарифы** — специальные цены для постоянных клиентов
- **Отсрочка платежа** — возможность постоплаты по договору
- **Выделенный менеджер** — персональное сопровождение заказов
- **Приоритетная обработка** — ускоренная обработка заявок
- **Расширенная отчётность** — детализированные отчёты по всем отправлениям

## 2. Порядок заключения договора

**2.1.** Для заключения договора необходимо предоставить:
- Копию свидетельства о регистрации (БИН)
- Реквизиты организации
- Контактные данные ответственного лица
- Доверенность (при необходимости)

**2.2.** После проверки документов менеджер свяжется с вами для согласования условий договора.

## 3. Способы оплаты

Для юридических лиц доступны следующие способы оплаты:
- Безналичный расчёт по счёту
- Оплата банковской картой через приложение
- Постоплата (по согласованию)

## 4. Документооборот

**4.1.** По каждой доставке предоставляются:
- Акт выполненных работ
- Счёт-фактура
- Транспортная накладная

**4.2.** Документы доступны в личном кабинете и могут быть отправлены по электронной почте.

## 5. Интеграция с системами учёта

Мы предоставляем возможность интеграции с вашими системами учёта:
- API для автоматизации заказов
- Выгрузка данных в форматах Excel, CSV
- Интеграция с 1С

## 6. Контакты для юридических лиц

**Отдел корпоративных продаж:**
- Email: b2b@sapsano.kz
- Телефон: +7 727 123-457

**Время работы:**
- Пн-Пт: 09:00 - 18:00
- Сб-Вс: выходной

---

*Оставьте заявку, и наш менеджер свяжется с вами в течение рабочего дня.*
''';
