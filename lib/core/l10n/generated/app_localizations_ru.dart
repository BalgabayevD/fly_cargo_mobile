// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Sapsano';

  @override
  String get success => 'Успех';

  @override
  String get error => 'Ошибка';

  @override
  String get loading => 'Загрузка...';

  @override
  String get retry => 'Повторить';

  @override
  String get cancel => 'Отменить';

  @override
  String get save => 'Сохранить';

  @override
  String get delete => 'Удалить';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String get done => 'Готово';

  @override
  String get close => 'Закрыть';

  @override
  String get phoneInputHint => '+7 (XXX) XXX-XX-XX';

  @override
  String get enterPhoneNumber => 'Введите номер телефона';

  @override
  String get enterCode => 'Введите код';

  @override
  String codeSentTo(String phone) {
    return 'Код отправлен на номер $phone';
  }

  @override
  String get resendCode => 'Отправить код повторно';

  @override
  String resendCodeIn(int seconds) {
    return 'Повторный код через $seconds сек';
  }

  @override
  String get orderCreated => 'Ваша заявка на отправку создана';

  @override
  String get goToOrders => 'Перейти в заказы';

  @override
  String get paymentError => 'Ошибка оплаты';

  @override
  String get paymentErrorMessage =>
      'Произошла ошибка при оплате. Попробуйте снова.';

  @override
  String get pay => 'Оплатить';

  @override
  String payAmount(String amount) {
    return 'Оплатить $amount';
  }

  @override
  String get addCard => 'Добавить карту';

  @override
  String get selectCard => 'Выберите карту';

  @override
  String get noCards => 'Нет сохранённых карт';

  @override
  String get packageDescription => 'Описание посылки';

  @override
  String get describePackageContents => 'Опишите содержимое посылки';

  @override
  String get enterPackageDescription => 'Введите описание посылки';

  @override
  String get sender => 'Отправитель';

  @override
  String get recipient => 'Получатель';

  @override
  String get recipientName => 'Имя получателя';

  @override
  String get recipientPhone => 'Телефон получателя';

  @override
  String get enterRecipientName => 'Введите имя получателя';

  @override
  String get enterRecipientPhone => 'Введите телефон получателя';

  @override
  String get from => 'Откуда';

  @override
  String get to => 'Куда';

  @override
  String get selectCity => 'Выберите город';

  @override
  String get selectAddress => 'Выберите адрес';

  @override
  String get searchAddress => 'Поиск адреса';

  @override
  String get noAddressFound => 'Адрес не найден';

  @override
  String get selectTariff => 'Выберите тариф';

  @override
  String get dimensions => 'Габариты';

  @override
  String get weight => 'Вес';

  @override
  String weightKg(String weight) {
    return '$weight кг';
  }

  @override
  String get length => 'Длина';

  @override
  String get width => 'Ширина';

  @override
  String get height => 'Высота';

  @override
  String get cm => 'см';

  @override
  String get kg => 'кг';

  @override
  String get createOrder => 'Создать заказ';

  @override
  String get orders => 'Заказы';

  @override
  String get myOrders => 'Мои заказы';

  @override
  String get noOrders => 'Нет заказов';

  @override
  String orderNumber(String number) {
    return 'Заказ №$number';
  }

  @override
  String get orderStatus => 'Статус заказа';

  @override
  String get statusPending => 'Ожидает';

  @override
  String get statusProcessing => 'В обработке';

  @override
  String get statusInTransit => 'В пути';

  @override
  String get statusDelivered => 'Доставлен';

  @override
  String get statusCancelled => 'Отменён';

  @override
  String get deliveryDate => 'Дата доставки';

  @override
  String expectedDelivery(String date) {
    return 'Ожидаемая доставка: $date';
  }

  @override
  String get profile => 'Профиль';

  @override
  String get settings => 'Настройки';

  @override
  String get logout => 'Выйти';

  @override
  String get deleteAccount => 'Удалить аккаунт';

  @override
  String get deleteAccountConfirm => 'Вы уверены, что хотите удалить аккаунт?';

  @override
  String get featureInDevelopment => 'Функция в разработке';

  @override
  String get share => 'Поделиться';

  @override
  String get openInMaps => 'Открыть в картах';

  @override
  String get accept => 'Принять';

  @override
  String get decline => 'Отклонить';

  @override
  String get home => 'Главная';

  @override
  String get total => 'Итого';

  @override
  String get price => 'Цена';

  @override
  String priceAmount(String amount) {
    return '$amount ₸';
  }

  @override
  String get continue_ => 'Продолжить';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get enterComment => 'Введите комментарий';

  @override
  String get comment => 'Комментарий';

  @override
  String get optional => 'Необязательно';

  @override
  String get required => 'Обязательно';

  @override
  String get fieldRequired => 'Это поле обязательно';

  @override
  String get invalidPhoneNumber => 'Неверный номер телефона';

  @override
  String get somethingWentWrong => 'Что-то пошло не так';

  @override
  String get tryAgain => 'Попробуйте снова';

  @override
  String get noInternetConnection => 'Нет подключения к интернету';

  @override
  String get serverError => 'Ошибка сервера';

  @override
  String get paymentFailed => 'Оплата не прошла';

  @override
  String get openKaspi => 'Открыть Kaspi.kz';
}
