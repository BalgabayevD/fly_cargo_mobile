# CLAUDE.md - Fly Cargo Mobile

## Обзор проекта

Flutter приложение для логистической компании Fly Cargo. Клиентское приложение для создания заказов на доставку грузов.

**Стек:** Flutter 3.x, BLoC, Clean Architecture, GetIt + Injectable, GoRouter, Retrofit

---

## Архитектура

### Clean Architecture (обязательно для всех features)

```
lib/
├── core/                    # Общие ресурсы
│   ├── design_system/       # UI компоненты, цвета, типография
│   ├── di/                  # Dependency Injection (GetIt)
│   ├── network/             # Dio, интерцепторы
│   ├── router/              # GoRouter
│   └── extensions/          # Extensions
└── features/                # Бизнес-логика по фичам
    └── {feature_name}/
        ├── config/          # DI модуль фичи
        ├── data/            # API, DTO, Repository impl
        ├── domain/          # Entities, Repository interface, UseCases
        └── presentation/    # Pages, Widgets, BLoC
```

### Слои feature модуля

| Слой | Содержимое | Зависимости |
|------|------------|-------------|
| **presentation** | Pages, Widgets, BLoC | domain |
| **domain** | Entities, UseCases, Repository (interface) | ничего |
| **data** | DTO, RemoteSource, Repository impl | domain |
| **config** | DI модуль | data, domain |

---

## Правила кода

### 1. Presentation слой

**Только классы виджетов, НЕ функции:**
```dart
// Правильно
class PaymentSuccessWidget extends StatelessWidget { }

// Неправильно
Widget buildPaymentSuccess() { }
```

### 2. State Management - BLoC

```dart
@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;

  OrdersBloc(this._getOrdersUseCase) : super(const OrdersInitial()) {
    on<OrdersLoadRequested>(_onLoadRequested);
  }
}
```

**Events и States используют Equatable:**
```dart
abstract class OrdersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
```

### 3. Freezed для моделей

```dart
@freezed
sealed class OrderModel with _$OrderModel {
  const factory OrderModel({
    required int id,
    required String status,
    @Default('') String comment,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}
```

### 4. Dependency Injection

```dart
// UseCase
@injectable
class GetOrdersUseCase {
  final OrdersRepository _repository;
  GetOrdersUseCase(this._repository);
}

// Repository implementation
@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository { }

// Модуль для Retrofit
@module
abstract class OrdersModule {
  @factoryMethod
  OrdersRemoteSource provideRemoteSource(
    @Named('private-dio') Dio dio,
    ApiConfig config,
  ) => OrdersRemoteSource(dio, baseUrl: config.baseUrl);
}
```

### 5. Размер файлов

**Максимум 200 строк.** Если больше - разбить на несколько файлов.

### 6. Mixin и Extensions

Использовать при возможности для переиспользования кода:
```dart
// Extension
extension BuildContextX on BuildContext {
  GetIt get di => GetIt.instance;
}

// Mixin для presentation
mixin OrderValidationMixin {
  bool isValidOrder(OrderModel order) => order.id > 0;
}
```

---

## Дизайн-система

### Цвета (AppColors)

```dart
AppColors.primary      // #571B23 - основной бордовый
AppColors.success      // #8BC34A - зелёный
AppColors.danger       // #F44336 - красный
AppColors.warning      // #FF9800 - оранжевый
AppColors.info         // #03A9F4 - голубой

AppColors.surface1-5   // Шкала серого (light → dark)
AppColors.white        // #FFFFFF
```

### Отступы (AppSpacing)

```dart
AppSpacing.xs   // 4px
AppSpacing.sm   // 8px
AppSpacing.md   // 12px
AppSpacing.lg   // 16px
AppSpacing.xl   // 20px

AppSpacing.radiusMD  // 12px - стандартный border radius
AppSpacing.radiusXL  // 20px - для bottom sheets
```

### Иконки - HeroIcons

```dart
import 'package:heroicons/heroicons.dart';

HeroIcon(
  HeroIcons.xMark,
  style: HeroIconStyle.outline,  // или .solid
  size: 24,
  color: AppColors.surface5,
)
```

### Кнопки

```dart
AppButton(
  text: 'Оплатить',
  variant: AppButtonVariant.primary,
  size: AppButtonSize.large,
  isFullWidth: true,
  onPressed: () {},
)
```

---

## Навигация (GoRouter)

```dart
// Переход
context.go(AppRoutes.home);
context.push(AppRoutes.orderDetail);

// С параметрами
context.push(
  AppRoutes.orderDetail,
  extra: OrderModel(...),
);
```

---

## API (Retrofit)

```dart
@RestApi(baseUrl: '')
abstract class OrdersRemoteSource {
  factory OrdersRemoteSource(Dio dio, {String baseUrl}) = _OrdersRemoteSource;

  @GET('/api/orders')
  Future<HttpResponse<List<OrderModel>>> getOrders();

  @POST('/api/orders')
  Future<HttpResponse<OrderModel>> createOrder(@Body() CreateOrderRequest request);
}
```

---

## Код-генерация

После изменения моделей или DI:
```bash
dart run build_runner build --delete-conflicting-outputs
```

Генерируемые файлы:
- `*.freezed.dart` - Freezed модели
- `*.g.dart` - JSON serialization, Retrofit
- `injection.config.dart` - DI конфигурация

---

## Naming Conventions

| Тип | Формат | Пример |
|-----|--------|--------|
| Файлы | snake_case | `payment_success_widget.dart` |
| Классы | PascalCase | `PaymentSuccessWidget` |
| Переменные | camelCase | `orderId`, `isLoading` |
| Константы | camelCase | `static const double radiusLG = 15.0` |
| Private | _prefix | `_onLoadRequested()` |

### Суффиксы классов

- `*Bloc` - BLoC классы
- `*Event` - BLoC events
- `*State` - BLoC states
- `*Repository` - репозитории
- `*UseCase` - use cases
- `*Page` - страницы (full screen)
- `*Widget` - виджеты (компоненты)
- `*RemoteSource` - API клиенты

---

## Структура BLoC файлов

```
presentation/
└── bloc/
    ├── orders_bloc.dart    # Логика
    ├── orders_event.dart   # События
    └── orders_state.dart   # Состояния
```

---

## Git

**Main branch:** `master`
**Current branch:** `clean-architecture`

**Commit message format:**
```
краткое описание на русском

🤖 Generated with Claude Code
```
