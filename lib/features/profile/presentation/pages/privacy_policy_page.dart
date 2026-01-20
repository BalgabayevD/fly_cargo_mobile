import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:fly_cargo/core/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyPage extends StatelessWidget {
  static const String path = '/privacy-policy';

  static String location() => Uri(path: path).toString();

  const PrivacyPolicyPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const PrivacyPolicyPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: context.l10n.privacyPolicyTitle,
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: BeColors.white,
      child: Markdown(
        data: _privacyPolicyContent,
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

const String _privacyPolicyContent = '''
# Политика конфиденциальности

Настоящая Политика конфиденциальности персональных данных (далее – Политика) действует в отношении всей информации, которую мобильное приложение SApsano может получить о Пользователе во время использования приложения.

## 1. Определение терминов

**1.1. Персональные данные** — любая информация, относящаяся к прямо или косвенно определенному или определяемому физическому лицу (субъекту персональных данных).

**1.2. Обработка персональных данных** — любое действие (операция) или совокупность действий (операций), совершаемых с использованием средств автоматизации или без использования таких средств с персональными данными.

**1.3. Пользователь** — лицо, использующее мобильное приложение Sapsano.

## 2. Сбор персональных данных

**2.1.** Приложение собирает следующие персональные данные:
- Имя и фамилия
- Номер телефона
- Адрес электронной почты
- Адреса доставки
- История заказов

**2.2.** Данные собираются с согласия Пользователя при регистрации в приложении.

## 3. Цели обработки персональных данных

**3.1.** Персональные данные Пользователя обрабатываются в следующих целях:
- Идентификация Пользователя
- Предоставление услуг по доставке грузов
- Связь с Пользователем для уточнения деталей заказа
- Улучшение качества обслуживания
- Отправка уведомлений о статусе заказа

## 4. Защита персональных данных

**4.1.** Мы принимаем необходимые организационные и технические меры для защиты персональных данных Пользователя от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения.

**4.2.** Доступ к персональным данным имеют только уполномоченные сотрудники.

## 5. Передача персональных данных третьим лицам

**5.1.** Персональные данные Пользователя могут быть переданы третьим лицам только в следующих случаях:
- Пользователь выразил согласие на такие действия
- Передача необходима для выполнения заказа (курьерские службы, партнеры)
- Передача предусмотрена законодательством Республики Казахстан

## 6. Права Пользователя

**6.1.** Пользователь имеет право:
- Получить информацию об обработке своих персональных данных
- Требовать уточнения, блокирования или уничтожения персональных данных
- Отозвать согласие на обработку персональных данных

## 7. Изменение Политики конфиденциальности

**7.1.** Мы оставляем за собой право вносить изменения в настоящую Политику. Новая редакция Политики вступает в силу с момента ее размещения в приложении.

## 8. Контактная информация

По всем вопросам, связанным с обработкой персональных данных, Вы можете обратиться:
- Email: support@sapsano.kz
- Телефон: +7 727 123-456

---

*Дата последнего обновления: январь 2026*
''';
