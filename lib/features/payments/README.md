# Payment Feature

## Описание
Модуль оплаты заказов через сохраненные карты или добавление новой карты.

## Структура

### Domain Layer
- **Entities**: `Card` - сущность карты
- **Repositories**: `PaymentRepository` - интерфейс репозитория
- **UseCases**:
  - `FetchCardsUseCase` - получение списка сохраненных карт
  - `AddCardUseCase` - добавление новой карты (возвращает URL для WebView)
  - `PayOrderUseCase` - оплата заказа выбранной картой

### Data Layer
- **DTO**: модели запросов/ответов API
- **Sources**: `PaymentRemoteSource` - API endpoints
- **Repositories**: `PaymentRepositoryImpl` - реализация репозитория

### Presentation Layer

#### BLoCs
1. **CardsListBloc** - управление списком карт
   - События: LoadRequested, RefreshRequested, CardSelected
   - Состояния: Initial, Loading, Loaded, Empty, Error

2. **AddCardBloc** - добавление новой карты
   - События: AddCardRequested, Completed, Cancelled
   - Состояния: Initial, Loading, FormReady, Success, Error

3. **EpaymentPayBloc** - процесс оплаты
   - События: PayRequested, Retry, Reset
   - Состояния: Initial, Processing, Success, Error

4. **PaymentFlowCubit** - управление flow'ом оплаты
   - Состояния: cards, addCard, processing, success, error

#### Widgets
- `CardsListWidget` - список сохраненных карт с выбором
- `AddCardWidget` - WebView для добавления карты
- `EmptyCardsWidget` - экран когда нет карт
- `PaymentProcessingWidget` - индикатор обработки платежа
- `PaymentSuccessWidget` - экран успешной оплаты
- `PaymentErrorWidget` - экран ошибки оплаты

## Использование

### Открытие BottomSheet оплаты

```dart
import 'package:fly_cargo/features/payments/presentation/payment_bottom_sheet.dart';

// В вашем виджете
final result = await showPaymentBottomSheet(
  context,
  orderId: 123,
  price: 2400.0,
);

if (result == true) {
  // Оплата прошла успешно
}
```

## Flow оплаты

1. **Загрузка карт**: При открытии BottomSheet автоматически загружается список карт
2. **Выбор действия**:
   - Если есть карты → показывается список для выбора
   - Если карт нет → показывается экран добавления карты
3. **Добавление карты**: Открывается WebView с формой от платежной системы
4. **Оплата**: После выбора карты пользователь нажимает "Оплатить"
5. **Результат**: 
   - Успех → показывается экран успеха
   - Ошибка → показывается экран ошибки с возможностью повтора

## API Endpoints

- `GET /payments/form/page` - получение URL формы добавления карты
- `GET /payment/cards` - получение списка сохраненных карт
- `POST /payments/pay` - оплата заказа

## Зависимости

- `flutter_bloc` - state management
- `webview_flutter` - WebView для добавления карт
- `injectable` - dependency injection
- `equatable` - сравнение состояний

## Примечания

- Все блоки автоматически регистрируются в DI через `@injectable`
- WebView отслеживает callback URL для определения успешного добавления карты
- При успешной оплате BottomSheet закрывается с результатом `true`

