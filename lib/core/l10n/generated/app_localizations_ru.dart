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

  @override
  String get authorization => 'Авторизация';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get phoneNumberHelpText =>
      'Поможет создавать и отслеживать\nваши заказы';

  @override
  String get phoneNumberHint => '+7 (777) 123-45-65';

  @override
  String get enterPhoneNumberError => 'Введите номер телефона';

  @override
  String get enterValidPhoneNumber => 'Введите корректный номер телефона';

  @override
  String get getCode => 'Получить код';

  @override
  String get confirmCode => 'Подтвердить';

  @override
  String get smsCode => 'СМС код';

  @override
  String smsCodeHelpText(String phone) {
    return 'Мы отправили 6 значный код по смс\nна номер $phone';
  }

  @override
  String get smsCodeLabel => 'Код';

  @override
  String get smsCodeHint => '144 356';

  @override
  String get send => 'Отправить';

  @override
  String get codeSentAgain => 'Код отправлен повторно';

  @override
  String get iAgreeWith => 'Я ознакомился и согласен с';

  @override
  String get privacyPolicy => 'политикой использования';

  @override
  String get and => 'и';

  @override
  String get termsOfService => 'условиями оферты';

  @override
  String get order => 'Заказ';

  @override
  String orderDetail(String orderId) {
    return 'Заказ $orderId';
  }

  @override
  String get delivery => 'Доставка';

  @override
  String deliveryOn(String date) {
    return 'Доставка в $date';
  }

  @override
  String get parcelSent => 'Посылка отправлена';

  @override
  String get processedAtWarehouse => 'Обработан на складе';

  @override
  String deliveryToCity(String city) {
    return 'Доставка в $city';
  }

  @override
  String get handedToCourier => 'Передано курьеру';

  @override
  String payWithAmount(String amount) {
    return 'Оплатить $amount тг';
  }

  @override
  String get attachBarcode => 'Привязать штрихкод';

  @override
  String get cancelOrder => 'Отменить';

  @override
  String get copyPaymentLink => 'Скопировать ссылку на платеж';

  @override
  String get paymentLinkCopied => 'Ссылка скопирована';

  @override
  String get noOrdersYet => 'У вас пока нет заказов';

  @override
  String get createFirstOrder =>
      'Создайте свой первый заказ\nна главной странице';

  @override
  String get errorOccurred => 'Произошла ошибка';

  @override
  String get authorizationRequired => 'Требуется авторизация';

  @override
  String get authorizationRequiredHelp =>
      'Для просмотра заказов\nнеобходимо войти в аккаунт';

  @override
  String get paymentSuccessful => 'Оплата прошла успешно!';

  @override
  String get recipientLabel => 'Получатель';

  @override
  String get deliveryLabel => 'Доставка';

  @override
  String get processingPayment => 'Обработка платежа...';

  @override
  String get pleaseWait => 'Пожалуйста, подождите';

  @override
  String get addCardPrompt => 'Добавьте карту';

  @override
  String get noSavedCards => 'У вас пока нет сохраненных карт';

  @override
  String get addingCard => 'Добавление карты';

  @override
  String get tryAgainButton => 'Попробовать снова';

  @override
  String paymentForOrder(String orderId) {
    return 'Оплата заказа №$orderId';
  }

  @override
  String get addingCardTitle => 'Добавление карты';

  @override
  String get notAuthorized => 'Вы не авторизованы';

  @override
  String get role => 'Роль';

  @override
  String get name => 'Имя';

  @override
  String get email => 'Email';

  @override
  String get logoutFromProfile => 'Выйти из профиля';

  @override
  String get deleteProfileRequest => 'Заявка на удаление профиля';

  @override
  String get deleteProfileInDevelopment =>
      'Функция удаления профиля в разработке';

  @override
  String get logoutTitle => 'Выход';

  @override
  String get logoutConfirmation => 'Вы уверены, что хотите выйти?';

  @override
  String get contacts => 'Контакты';

  @override
  String get contactPhone => 'Контактный телефон';

  @override
  String get mobilePhone => 'Сотовый телефон';

  @override
  String get whatsapp => 'Whatsapp';

  @override
  String get legalAddress => 'Юридический адрес';

  @override
  String get call => 'Позвонить';

  @override
  String get writeWhatsapp => 'Написать в Whatsapp';

  @override
  String get appAuthSettings => 'Авторизация в приложении';

  @override
  String appVersionInfo(String year, String version) {
    return 'Sapsano $year год. Версия $version';
  }

  @override
  String get recipientData => 'Данные получателя';

  @override
  String get recipientContactInfo => 'Контактная информация получателя';

  @override
  String get recipientContactInfoHelp =>
      'Укажите имя и номер телефона получателя для связи';

  @override
  String get saveData => 'Сохранить данные';

  @override
  String get description => 'Описание';

  @override
  String get descriptionLabel => 'Описание посылки';

  @override
  String get saveDescription => 'Сохранить';

  @override
  String get weightInKg => 'Вес, в кг';

  @override
  String addressIn(String city) {
    return 'Адрес в $city';
  }

  @override
  String get enterAddressPlaceholder => 'Введите адрес...';

  @override
  String get searchingAddresses => 'Поиск адресов...';

  @override
  String get addressSearchError => 'Ошибка поиска';

  @override
  String get addressesNotFound => 'Адреса не найдены';

  @override
  String get tryChangingQuery => 'Попробуйте изменить поисковый запрос';

  @override
  String get startTypingAddress => 'Начните вводить адрес';

  @override
  String get minTwoCharacters => 'Введите минимум 2 символа для поиска';

  @override
  String get chooseCity => 'Выберите город';

  @override
  String get enterAddressField => 'Введите адрес';

  @override
  String get city => 'Город';

  @override
  String get address => 'Адрес';

  @override
  String get apartment => 'Квартира';

  @override
  String get apartmentNumber => 'Номер квартиры';

  @override
  String get entrance => 'Подъезд';

  @override
  String get entranceNumber => 'Номер подъезда';

  @override
  String get floor => 'Этаж';

  @override
  String get floorNumber => 'Номер этажа';

  @override
  String get appLanguage => 'Язык приложения';

  @override
  String get russian => 'Русский';

  @override
  String get english => 'English';

  @override
  String get kazakh => 'Қазақша';

  @override
  String get notificationSettings => 'Настройка уведомлений';

  @override
  String get privacyPolicyTitle => 'Политика пользования';

  @override
  String get termsOfServiceTitle => 'Условия оферты';

  @override
  String get forLegalEntities => 'Для юридических лиц';

  @override
  String get transportationRules => 'Правила перевозки';

  @override
  String get addPhoto => 'Добавить\nфото';

  @override
  String get selectSource => 'Выберите источник';

  @override
  String get camera => 'Камера';

  @override
  String get gallery => 'Галерея';

  @override
  String get packagePhotos => 'Фото упаковки';

  @override
  String selectedPhotosCount(int count) {
    return 'Выбранные фото ($count)';
  }

  @override
  String get photoUploadError => 'Ошибка при загрузке фото';

  @override
  String get photoSelectionError => 'Ошибка при выборе фото';

  @override
  String get orderStatusCreated => 'Создан';

  @override
  String get orderStatusCancelled => 'Отменен';

  @override
  String get orderStatusDecided => 'Отклонен курьером';

  @override
  String get orderStatusAccepted => 'Ожидаем курьера';

  @override
  String get orderStatusProcessing => 'Обработка на складе';

  @override
  String get orderStatusDeliveryToCity => 'Доставка в Астану';

  @override
  String get orderStatusHandedToCourierShort => 'Передано курьеру';

  @override
  String get orderStatusCompleted => 'Доставлен';
}
