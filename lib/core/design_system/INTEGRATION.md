# Руководство по интеграции дизайн-системы Fly Cargo

## 🚀 Быстрый старт

### 1. Применение темы в приложении

Откройте файл `lib/main.dart` и примените тему:

```dart
import 'package:flutter/material.dart';
import 'package:fly_cargo/core/design_system/design_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fly Cargo',
      theme: AppTheme.lightTheme, // 👈 Применяем тему
      home: const HomePage(),
    );
  }
}
```

### 2. Использование в виджетах

Импортируйте дизайн-систему в начале файла:

```dart
import 'package:fly_cargo/core/design_system/design_system.dart';
```

Теперь вы можете использовать все компоненты:

```dart
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пример'),
      ),
      body: Padding(
        padding: DesignUtils.screenPadding,
        child: Column(
          children: [
            // Заголовок
            Text('Добро пожаловать', style: AppTypography.h1),
            
            DesignUtils.verticalSpaceLG,
            
            // Карточка
            AppCard(
              child: Column(
                children: [
                  Text('Информация', style: AppTypography.h5),
                  DesignUtils.verticalSpaceMD,
                  Text('Текст в карточке', style: AppTypography.bodyMedium),
                ],
              ),
            ),
            
            DesignUtils.verticalSpaceXL,
            
            // Кнопка
            AppButton(
              text: 'Продолжить',
              isFullWidth: true,
              onPressed: () {
                DesignUtils.showSnackBar(
                  context,
                  message: 'Успешно!',
                  type: SnackBarType.success,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

## 📋 Миграция существующего кода

### Замена цветов

**Было:**
```dart
Color(0xFF007AFF)
Colors.blue
Theme.of(context).primaryColor
```

**Стало:**
```dart
AppColors.primary
AppColors.info // для информационных элементов
Theme.of(context).colorScheme.primary
```

### Замена отступов

**Было:**
```dart
EdgeInsets.all(16.0)
SizedBox(height: 20)
```

**Стало:**
```dart
EdgeInsets.all(AppSpacing.lg)
DesignUtils.verticalSpaceXL
```

### Замена типографики

**Было:**
```dart
TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
)
```

**Стало:**
```dart
AppTypography.h3
```

### Замена кнопок

**Было:**
```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(vertical: 16),
  ),
  child: Text('Кнопка'),
)
```

**Стало:**
```dart
AppButton(
  text: 'Кнопка',
  size: AppButtonSize.large,
  variant: AppButtonVariant.primary,
  onPressed: () {},
)
```

### Замена карточек

**Было:**
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text('Содержимое'),
)
```

**Стало:**
```dart
AppCard(
  variant: AppCardVariant.elevated,
  child: Text('Содержимое'),
)
```

## 🎨 Просмотр компонентов

Для просмотра всех доступных компонентов и цветов:

```dart
// Добавьте в роутинг или откройте напрямую:

// Все компоненты
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const DesignSystemShowcase(),
  ),
);

// Цветовая палитра
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const ColorPalettePage(),
  ),
);
```

## 💡 Лучшие практики

### 1. Всегда используйте константы

❌ **Плохо:**
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Color(0xFFE47B35),
    borderRadius: BorderRadius.circular(12),
  ),
)
```

✅ **Хорошо:**
```dart
Container(
  padding: EdgeInsets.all(AppSpacing.lg),
  decoration: BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppSpacing.radiusMD),
  ),
)
```

### 2. Используйте утилиты DesignUtils

❌ **Плохо:**
```dart
Column(
  children: [
    Widget1(),
    SizedBox(height: 16),
    Widget2(),
    SizedBox(height: 16),
    Widget3(),
  ],
)
```

✅ **Хорошо:**
```dart
Column(
  children: [
    Widget1(),
    DesignUtils.verticalSpaceLG,
    Widget2(),
    DesignUtils.verticalSpaceLG,
    Widget3(),
  ],
)
```

### 3. Используйте семантические цвета

❌ **Плохо:**
```dart
Container(color: AppColors.accentGreen) // для успеха
Container(color: AppColors.accentRed)   // для ошибки
```

✅ **Хорошо:**
```dart
Container(color: AppColors.success)
Container(color: AppColors.error)
```

### 4. Используйте компоненты вместо базовых виджетов

❌ **Плохо:**
```dart
ElevatedButton(...)
Container(decoration: BoxDecoration(...))
```

✅ **Хорошо:**
```dart
AppButton(...)
AppCard(...)
```

## 🔧 Расширение дизайн-системы

### Добавление нового цвета

Добавьте в `lib/core/design_system/colors.dart`:

```dart
static const Color customColor = Color(0xFF123456);
```

### Добавление нового компонента

1. Создайте файл в `lib/core/design_system/components/`
2. Добавьте экспорт в `design_system.dart`
3. Используйте существующие константы цветов, отступов и типографики

### Добавление новой утилиты

Добавьте в `lib/core/design_system/utils.dart`:

```dart
static Widget myCustomUtility() {
  return Container(
    // Используйте AppColors, AppSpacing и т.д.
  );
}
```

## 📚 Дополнительные ресурсы

- **README.md** - полная документация по всем компонентам
- **examples/design_system_showcase.dart** - живые примеры всех компонентов
- **examples/color_palette_page.dart** - визуальная палитра всех цветов

## 🤝 Поддержка

При возникновении вопросов или проблем:
1. Проверьте документацию в README.md
2. Посмотрите примеры в папке examples/
3. Обратитесь к команде разработки

---

**Помните:** Консистентность - ключ к отличному UI! Всегда используйте компоненты дизайн-системы вместо создания своих собственных.


