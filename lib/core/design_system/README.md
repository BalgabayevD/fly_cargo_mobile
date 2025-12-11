# Дизайн-система Fly Cargo

Комплексная дизайн-система для мобильного приложения Fly Cargo с использованием фирменных цветов компании.

## 🎨 Цветовая палитра

### Основные цвета

- **Primary (Основной)**: `#E47B35` - оранжевый цвет бренда
  - Primary Light: `#FF9A5C` - для hover-состояний
  - Primary Dark: `#C86020` - для pressed-состояний

- **Secondary (Вторичный)**: `#FFE4D2` - светло-оранжевый
  - Secondary Light: `#FFF3E9` - очень светлый оранжевый
  - Secondary Dark: `#FFD1B3` - средний светло-оранжевый

### Системные цвета

- **Success**: `#34C759` - зеленый для успешных действий
- **Warning**: `#FFC107` - желтый для предупреждений
- **Error**: `#FF3B30` - красный для ошибок
- **Info**: `#2196F3` - синий для информационных сообщений

### Серые оттенки

От `gray50` (#F8F9FA) до `gray900` (#0D0D0D) - полная палитра серых тонов для текста, границ и фонов.

## 📝 Типография

### Заголовки
- `h1` - 32px, Bold
- `h2` - 28px, Bold
- `h3` - 24px, SemiBold
- `h4` - 20px, SemiBold
- `h5` - 18px, SemiBold
- `h6` - 16px, SemiBold

### Основной текст
- `bodyLarge` - 16px, Regular
- `bodyMedium` - 14px, Regular
- `bodySmall` - 12px, Regular

### Кнопки
- `buttonLarge` - 16px, SemiBold
- `buttonMedium` - 14px, SemiBold
- `buttonSmall` - 12px, SemiBold

### Подзаголовки
- `subtitleLarge` - 16px, Medium
- `subtitleMedium` - 14px, Medium
- `subtitleSmall` - 12px, Medium

## 🔲 Отступы и размеры

### Отступы (Spacing)
```dart
xs  = 4px   // Минимальный отступ
sm  = 8px   // Маленький отступ
md  = 12px  // Средний отступ
lg  = 16px  // Большой отступ
xl  = 20px  // Очень большой отступ
xxl = 24px  // Огромный отступ
```

### Радиусы скругления
```dart
radiusXS  = 4px   // Минимальное скругление
radiusSM  = 8px   // Маленькое скругление
radiusMD  = 12px  // Среднее скругление
radiusLG  = 15px  // Большое скругление
radiusXL  = 20px  // Очень большое скругление
radiusRound = 50px // Круглое
```

### Высота кнопок
```dart
buttonHeightSM = 32px
buttonHeightMD = 40px
buttonHeightLG = 47px
buttonHeightXL = 50px
```

### Размеры иконок
```dart
iconSizeXS = 12px
iconSizeSM = 16px
iconSizeMD = 20px
iconSizeLG = 24px
iconSizeXL = 32px
```

## 🎭 Компоненты

### Кнопки

#### AppButton
```dart
// Primary кнопка
AppButton(
  text: 'Отправить',
  variant: AppButtonVariant.primary,
  size: AppButtonSize.medium,
  onPressed: () {},
)

// Secondary кнопка
AppButton(
  text: 'Отмена',
  variant: AppButtonVariant.secondary,
  size: AppButtonSize.medium,
  onPressed: () {},
)

// Outline кнопка
AppButton(
  text: 'Назад',
  variant: AppButtonVariant.outline,
  size: AppButtonSize.medium,
  onPressed: () {},
)

// С иконкой
AppButton(
  text: 'Сохранить',
  icon: Icons.save,
  variant: AppButtonVariant.primary,
  onPressed: () {},
)

// Полная ширина
AppButton(
  text: 'Продолжить',
  isFullWidth: true,
  onPressed: () {},
)
```

#### AppIconButton
```dart
AppIconButton(
  icon: Icons.settings,
  size: AppButtonSize.medium,
  variant: AppButtonVariant.ghost,
  onPressed: () {},
)
```

#### AppLoadingButton
```dart
AppLoadingButton(
  text: 'Отправить',
  onPressed: () async {
    // Асинхронное действие
    await Future.delayed(Duration(seconds: 2));
  },
)
```

### Карточки

#### AppCard
```dart
// Elevated карточка (с тенью)
AppCard(
  variant: AppCardVariant.elevated,
  child: Text('Содержимое карточки'),
)

// Outlined карточка (с рамкой)
AppCard(
  variant: AppCardVariant.outlined,
  child: Text('Содержимое карточки'),
)

// Filled карточка (с заливкой)
AppCard(
  variant: AppCardVariant.filled,
  child: Text('Содержимое карточки'),
)

// Карточка с действием
AppCard(
  onTap: () => print('Нажато!'),
  child: Text('Нажми меня'),
)
```

#### AppCardWithTitle
```dart
AppCardWithTitle(
  title: 'Заголовок карточки',
  titleAction: IconButton(
    icon: Icon(Icons.more_vert),
    onPressed: () {},
  ),
  child: Text('Содержимое карточки'),
)
```

#### AppIconCard
```dart
AppIconCard(
  icon: Icons.location_on,
  title: 'Адрес доставки',
  subtitle: 'ул. Пушкина, д. 10',
  onTap: () {},
)
```

#### AppSelectionCard
```dart
AppSelectionCard(
  isSelected: isSelected,
  onTap: () => setState(() => isSelected = !isSelected),
  child: Text('Выберите меня'),
)
```

#### AppPriceCard
```dart
AppPriceCard(
  title: 'Стандартная доставка',
  price: '500 ₽',
  subtitle: '2-3 дня',
  onTap: () {},
)
```

## 🎨 Градиенты

```dart
// Primary градиент
Container(
  decoration: BoxDecoration(
    gradient: AppColors.primaryGradient,
  ),
)

// Secondary градиент
Container(
  decoration: BoxDecoration(
    gradient: AppColors.secondaryGradient,
  ),
)

// Primary Dark градиент
Container(
  decoration: BoxDecoration(
    gradient: AppColors.primaryDarkGradient,
  ),
)
```

## 🎨 Тени

```dart
// Тень для карточки
Container(
  decoration: BoxDecoration(
    boxShadow: AppShadows.cardShadows,
  ),
)

// Тень для кнопки
Container(
  decoration: BoxDecoration(
    boxShadow: AppShadows.buttonShadows,
  ),
)
```

## 🎨 Использование темы

### В main.dart

```dart
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
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme, // Для темной темы
      home: const HomePage(),
    );
  }
}
```

### Доступ к цветам из контекста

```dart
// Через Theme
Theme.of(context).colorScheme.primary
Theme.of(context).colorScheme.secondary

// Или напрямую через AppColors
AppColors.primary
AppColors.secondary
```

## 📦 Импорт

Для использования дизайн-системы импортируйте:

```dart
import 'package:fly_cargo/core/design_system/design_system.dart';
```

Это даст доступ ко всем компонентам, цветам, типографике и утилитам дизайн-системы.

## 🎯 Рекомендации

1. **Всегда используйте компоненты** из дизайн-системы вместо стандартных Flutter виджетов
2. **Используйте константы** для отступов, размеров и цветов вместо жестко заданных значений
3. **Следуйте иерархии типографики** для согласованного визуального представления
4. **Используйте семантические цвета** (success, error, warning) для соответствующих состояний
5. **Применяйте градиенты** для создания визуального интереса на ключевых элементах

## 🔄 Обновления

При необходимости изменения дизайн-системы:
1. Обновите соответствующие константы в файлах цветов, типографики или отступов
2. Убедитесь, что изменения не нарушают существующий UI
3. Протестируйте на всех экранах приложения
4. Обновите эту документацию

---

**Версия**: 1.0.0  
**Дата создания**: Ноябрь 2025  
**Основные цвета**: #E47B35 (Primary), #FFE4D2 (Secondary)


