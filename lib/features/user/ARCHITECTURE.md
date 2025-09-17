# Архитектура профиля пользователя

## Структура файлов

```
user/
├── models/
│   └── user_profile_model.dart
│       ├── UserProfile
│       ├── PaymentCard
│       ├── Order
│       ├── OrderStatus (enum)
│       └── NotificationSettings
│
├── presentation/
│   ├── user_profile_page.dart (Главная страница)
│   │   ├── _buildProfileHeader()
│   │   ├── _buildUserMenuSection()
│   │   └── _buildServicesMenuSection()
│   │
│   ├── user_edit_profile_page.dart
│   │   ├── _buildAvatarSection()
│   │   ├── _buildEditForm()
│   │   └── _changeAvatar()
│   │
│   ├── user_payment_cards_page.dart
│   │   ├── _buildPaymentCard()
│   │   ├── _addPaymentCard()
│   │   └── _handleCardAction()
│   │
│   ├── user_notifications_page.dart
│   │   ├── _buildNotificationSection()
│   │   ├── _buildNotificationHistory()
│   │   └── _saveSettings()
│   │
│   ├── user_order_history_page.dart
│   │   ├── _buildFilterChips()
│   │   ├── _buildOrderCard()
│   │   └── _viewOrderDetails()
│   │
│   ├── user_payments_page.dart
│   │   ├── _buildStatsSection()
│   │   ├── _buildTransactionCard()
│   │   └── _getFilteredTransactions()
│   │
│   ├── user_cost_calculator_page.dart
│   │   ├── _buildCalculatorForm()
│   │   ├── _buildServiceTypeSelector()
│   │   ├── _buildUrgencySelector()
│   │   └── _calculateCost()
│   │
│   └── user_demo_page.dart
│       └── _FeatureItem
```

## Поток навигации

```
UserDemoPage
    ↓
UserProfilePage (Главная)
    ├── UserEditProfilePage (Мой профиль)
    ├── UserPaymentCardsPage (Платежные карты)
    ├── UserNotificationsPage (Уведомления)
    ├── UserOrderHistoryPage (История заказов)
    ├── UserPaymentsPage (Платежи)
    └── UserCostCalculatorPage (Калькулятор стоимости)
```

## Компоненты дизайн-системы

Используемые компоненты из `lib/core/design_system/`:
- `AppCard` - карточки для группировки контента
- `AppButton` - кнопки с различными вариантами
- `AppColors` - цветовая палитра
- `AppSpacing` - отступы и размеры
- `AppTypography` - типографика

## Состояния данных

### Моковые данные
Все страницы используют тестовые данные для демонстрации:
- `_getMockProfile()` - профиль пользователя
- `_getMockPaymentCards()` - платежные карты
- `_getMockOrders()` - история заказов
- `_getMockTransactions()` - история платежей
- `_getMockNotifications()` - уведомления

### Состояния UI
- Загрузка (`_isLoading`)
- Пустые списки (`_buildEmptyState()`)
- Фильтрация (`_selectedFilter`, `_selectedPeriod`)
- Выбор опций (`_selectedServiceType`, `_selectedUrgency`)

## Особенности реализации

1. **Консистентность**: Все страницы следуют единому стилю
2. **Навигация**: Полная навигация между страницами
3. **Фильтрация**: Возможность фильтрации данных
4. **Модальные окна**: Bottom sheets для дополнительных действий
5. **Валидация**: Проверка форм перед отправкой
6. **Адаптивность**: Поддержка различных размеров экрана
