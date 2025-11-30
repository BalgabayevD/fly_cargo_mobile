# Дизайн-система Fly Cargo - Краткая справка

## 🎨 Цвета бренда

```dart
AppColors.primary          // #E47B35 - главный оранжевый
AppColors.primaryLight     // #FF9A5C - светлый оранжевый
AppColors.primaryDark      // #C86020 - темный оранжевый
AppColors.secondary        // #FFE4D2 - вторичный светло-оранжевый
AppColors.secondaryLight   // #FFF3E9 - очень светлый
AppColors.secondaryDark    // #FFD1B3 - средний светлый
```

## 📏 Отступы

```dart
AppSpacing.xs   // 4px
AppSpacing.sm   // 8px
AppSpacing.md   // 12px
AppSpacing.lg   // 16px
AppSpacing.xl   // 20px
AppSpacing.xxl  // 24px
```

## 📝 Типография

```dart
AppTypography.h1           // 32px Bold
AppTypography.h2           // 28px Bold
AppTypography.h3           // 24px SemiBold
AppTypography.bodyLarge    // 16px Regular
AppTypography.bodyMedium   // 14px Regular
AppTypography.bodySmall    // 12px Regular
```

## 🔘 Кнопки

```dart
AppButton(
  text: 'Текст',
  variant: AppButtonVariant.primary,  // primary, secondary, outline, ghost, danger
  size: AppButtonSize.medium,         // small, medium, large, extraLarge
  onPressed: () {},
)
```

## 🃏 Карточки

```dart
AppCard(
  variant: AppCardVariant.elevated,  // elevated, outlined, filled
  child: Widget(),
)
```

## 🛠 Утилиты

```dart
DesignUtils.verticalSpaceLG           // Вертикальный отступ
DesignUtils.horizontalSpaceMD         // Горизонтальный отступ
DesignUtils.screenPadding             // Padding для экрана
DesignUtils.loader()                  // Прогресс-индикатор
DesignUtils.badge(text: '99+')        // Значок
DesignUtils.avatar(initials: 'AB')    // Аватар
DesignUtils.showSnackBar(             // Снекбар
  context,
  message: 'Текст',
  type: SnackBarType.success,
)
```

## 🎭 Применение темы

```dart
MaterialApp(
  theme: AppTheme.lightTheme,
  home: HomePage(),
)
```

## 📦 Импорт

```dart
import 'package:fly_cargo/core/design_system/design_system.dart';
```

## 📚 Документация

- **README.md** - полная документация
- **INTEGRATION.md** - руководство по интеграции
- **CHANGELOG.md** - история изменений
- **examples/** - живые примеры

## 🎯 Быстрый пример

```dart
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пример')),
      body: Padding(
        padding: DesignUtils.screenPadding,
        child: Column(
          children: [
            Text('Заголовок', style: AppTypography.h3),
            DesignUtils.verticalSpaceLG,
            AppCard(
              child: Text('Карточка', style: AppTypography.bodyMedium),
            ),
            DesignUtils.verticalSpaceXL,
            AppButton(
              text: 'Действие',
              isFullWidth: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
```

---

**Версия**: 1.0.0 | **Дата**: 28.11.2025 | **Цвета**: #E47B35, #FFE4D2


