import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fly_cargo/core/design_system/components/colors.dart';
import 'package:fly_cargo/core/design_system/components/page.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';
import 'package:go_router/go_router.dart';

class CancelReasonPage extends StatelessWidget {
  static const String path = '/cancel-reason';

  static String location() => Uri(path: path).toString();

  const CancelReasonPage({super.key});

  static GoRoute route({GlobalKey<NavigatorState>? parentNavigatorKey}) {
    return GoRoute(
      path: path,
      parentNavigatorKey: parentNavigatorKey,
      builder: (context, state) => const CancelReasonPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BePage(
      isBorder: true,
      title: 'Отмена заказа',
      automaticallyImplyLeading: true,
      backgroundColor: BeColors.white,
      centerTitle: true,
      child: Markdown(
        data: _cancelReasonContent,
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

const String _cancelReasonContent = '''

## Почему отмена платная?

После того как курьер принял ваш заказ, компания несет расходы на:

- Время курьера
- Транспортные расходы
- Административные расходы

## Как рассчитывается сумма?

Сумма отмены зависит от статуса заказа:

- **До принятия курьером** - бесплатно
- **После принятия** - фиксированная сумма

## Когда отмена бесплатна?

Вы можете отменить заказ бесплатно, пока курьер не принял его в работу.
''';
