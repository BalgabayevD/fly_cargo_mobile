import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ru'),
  ];

  /// Application title
  ///
  /// In ru, this message translates to:
  /// **'Sapsano'**
  String get appTitle;

  /// Success message title
  ///
  /// In ru, this message translates to:
  /// **'Успех'**
  String get success;

  /// Error message title
  ///
  /// In ru, this message translates to:
  /// **'Ошибка'**
  String get error;

  /// Loading indicator text
  ///
  /// In ru, this message translates to:
  /// **'Загрузка...'**
  String get loading;

  /// Retry button text
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;

  /// Cancel button text
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get cancel;

  /// Save button text
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// Delete button text
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// Back button text
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get back;

  /// Next button text
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// Done button text
  ///
  /// In ru, this message translates to:
  /// **'Готово'**
  String get done;

  /// Close button text
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// Phone number input hint
  ///
  /// In ru, this message translates to:
  /// **'+7 (XXX) XXX-XX-XX'**
  String get phoneInputHint;

  /// Enter phone number prompt
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enterPhoneNumber;

  /// Enter verification code prompt
  ///
  /// In ru, this message translates to:
  /// **'Введите код'**
  String get enterCode;

  /// Code sent message
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен на номер {phone}'**
  String codeSentTo(String phone);

  /// Resend code button text
  ///
  /// In ru, this message translates to:
  /// **'Отправить код повторно'**
  String get resendCode;

  /// Resend code countdown
  ///
  /// In ru, this message translates to:
  /// **'Повторный код через {seconds} сек'**
  String resendCodeIn(int seconds);

  /// Order created success message
  ///
  /// In ru, this message translates to:
  /// **'Ваша заявка на отправку создана'**
  String get orderCreated;

  /// Go to orders button text
  ///
  /// In ru, this message translates to:
  /// **'Перейти в заказы'**
  String get goToOrders;

  /// Payment error title
  ///
  /// In ru, this message translates to:
  /// **'Ошибка оплаты'**
  String get paymentError;

  /// Payment error description
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка при оплате. Попробуйте снова.'**
  String get paymentErrorMessage;

  /// Pay button text
  ///
  /// In ru, this message translates to:
  /// **'Оплатить'**
  String get pay;

  /// Pay with amount button text
  ///
  /// In ru, this message translates to:
  /// **'Оплатить {amount}'**
  String payAmount(String amount);

  /// Add card button text
  ///
  /// In ru, this message translates to:
  /// **'Добавить карту'**
  String get addCard;

  /// Select card prompt
  ///
  /// In ru, this message translates to:
  /// **'Выберите карту'**
  String get selectCard;

  /// No saved cards message
  ///
  /// In ru, this message translates to:
  /// **'Нет сохранённых карт'**
  String get noCards;

  /// Package description title
  ///
  /// In ru, this message translates to:
  /// **'Описание посылки'**
  String get packageDescription;

  /// Package description hint
  ///
  /// In ru, this message translates to:
  /// **'Опишите содержимое посылки'**
  String get describePackageContents;

  /// Package description input label
  ///
  /// In ru, this message translates to:
  /// **'Введите описание посылки'**
  String get enterPackageDescription;

  /// Sender label
  ///
  /// In ru, this message translates to:
  /// **'Отправитель'**
  String get sender;

  /// Recipient label
  ///
  /// In ru, this message translates to:
  /// **'Получатель'**
  String get recipient;

  /// Recipient name label
  ///
  /// In ru, this message translates to:
  /// **'Имя получателя'**
  String get recipientName;

  /// Recipient phone label
  ///
  /// In ru, this message translates to:
  /// **'Телефон получателя'**
  String get recipientPhone;

  /// Recipient name input hint
  ///
  /// In ru, this message translates to:
  /// **'Введите имя получателя'**
  String get enterRecipientName;

  /// Recipient phone input hint
  ///
  /// In ru, this message translates to:
  /// **'Введите телефон получателя'**
  String get enterRecipientPhone;

  /// From location label
  ///
  /// In ru, this message translates to:
  /// **'Откуда'**
  String get from;

  /// To location label
  ///
  /// In ru, this message translates to:
  /// **'Куда'**
  String get to;

  /// Select city prompt
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get selectCity;

  /// Select address prompt
  ///
  /// In ru, this message translates to:
  /// **'Выберите адрес'**
  String get selectAddress;

  /// Address search label
  ///
  /// In ru, this message translates to:
  /// **'Поиск адреса'**
  String get searchAddress;

  /// No address found message
  ///
  /// In ru, this message translates to:
  /// **'Адрес не найден'**
  String get noAddressFound;

  /// Select tariff prompt
  ///
  /// In ru, this message translates to:
  /// **'Выберите тариф'**
  String get selectTariff;

  /// Dimensions label
  ///
  /// In ru, this message translates to:
  /// **'Габариты'**
  String get dimensions;

  /// Weight label
  ///
  /// In ru, this message translates to:
  /// **'Вес'**
  String get weight;

  /// Weight in kg
  ///
  /// In ru, this message translates to:
  /// **'{weight} кг'**
  String weightKg(String weight);

  /// Length label
  ///
  /// In ru, this message translates to:
  /// **'Длина'**
  String get length;

  /// Width label
  ///
  /// In ru, this message translates to:
  /// **'Ширина'**
  String get width;

  /// Height label
  ///
  /// In ru, this message translates to:
  /// **'Высота'**
  String get height;

  /// Centimeters unit
  ///
  /// In ru, this message translates to:
  /// **'см'**
  String get cm;

  /// Kilograms unit
  ///
  /// In ru, this message translates to:
  /// **'кг'**
  String get kg;

  /// Create order button text
  ///
  /// In ru, this message translates to:
  /// **'Создать заказ'**
  String get createOrder;

  /// Orders tab title
  ///
  /// In ru, this message translates to:
  /// **'Заказы'**
  String get orders;

  /// My orders title
  ///
  /// In ru, this message translates to:
  /// **'Мои заказы'**
  String get myOrders;

  /// No orders message
  ///
  /// In ru, this message translates to:
  /// **'Нет заказов'**
  String get noOrders;

  /// Order number
  ///
  /// In ru, this message translates to:
  /// **'Заказ №{number}'**
  String orderNumber(String number);

  /// Order status label
  ///
  /// In ru, this message translates to:
  /// **'Статус заказа'**
  String get orderStatus;

  /// Pending status
  ///
  /// In ru, this message translates to:
  /// **'Ожидает'**
  String get statusPending;

  /// Processing status
  ///
  /// In ru, this message translates to:
  /// **'В обработке'**
  String get statusProcessing;

  /// In transit status
  ///
  /// In ru, this message translates to:
  /// **'В пути'**
  String get statusInTransit;

  /// Delivered status
  ///
  /// In ru, this message translates to:
  /// **'Доставлен'**
  String get statusDelivered;

  /// Cancelled status
  ///
  /// In ru, this message translates to:
  /// **'Отменён'**
  String get statusCancelled;

  /// Delivery date label
  ///
  /// In ru, this message translates to:
  /// **'Дата доставки'**
  String get deliveryDate;

  /// Expected delivery message
  ///
  /// In ru, this message translates to:
  /// **'Ожидаемая доставка: {date}'**
  String expectedDelivery(String date);

  /// Profile tab title
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// Settings title
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// Logout button text
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get logout;

  /// Delete account button text
  ///
  /// In ru, this message translates to:
  /// **'Удалить аккаунт'**
  String get deleteAccount;

  /// Delete account confirmation message
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить аккаунт?'**
  String get deleteAccountConfirm;

  /// Feature in development message
  ///
  /// In ru, this message translates to:
  /// **'Функция в разработке'**
  String get featureInDevelopment;

  /// Share button text
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get share;

  /// Open in maps button text
  ///
  /// In ru, this message translates to:
  /// **'Открыть в картах'**
  String get openInMaps;

  /// Accept button text
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get accept;

  /// Decline button text
  ///
  /// In ru, this message translates to:
  /// **'Отклонить'**
  String get decline;

  /// Home tab title
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get home;

  /// Total label
  ///
  /// In ru, this message translates to:
  /// **'Итого'**
  String get total;

  /// Price label
  ///
  /// In ru, this message translates to:
  /// **'Цена'**
  String get price;

  /// Price with currency
  ///
  /// In ru, this message translates to:
  /// **'{amount} ₸'**
  String priceAmount(String amount);

  /// Continue button text
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get continue_;

  /// Confirm button text
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirm;

  /// Enter comment hint
  ///
  /// In ru, this message translates to:
  /// **'Введите комментарий'**
  String get enterComment;

  /// Comment label
  ///
  /// In ru, this message translates to:
  /// **'Комментарий'**
  String get comment;

  /// Optional field indicator
  ///
  /// In ru, this message translates to:
  /// **'Необязательно'**
  String get optional;

  /// Required field indicator
  ///
  /// In ru, this message translates to:
  /// **'Обязательно'**
  String get required;

  /// Field required error message
  ///
  /// In ru, this message translates to:
  /// **'Это поле обязательно'**
  String get fieldRequired;

  /// Invalid phone number error
  ///
  /// In ru, this message translates to:
  /// **'Неверный номер телефона'**
  String get invalidPhoneNumber;

  /// Generic error message
  ///
  /// In ru, this message translates to:
  /// **'Что-то пошло не так'**
  String get somethingWentWrong;

  /// Try again message
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте снова'**
  String get tryAgain;

  /// No internet connection message
  ///
  /// In ru, this message translates to:
  /// **'Нет подключения к интернету'**
  String get noInternetConnection;

  /// Server error message
  ///
  /// In ru, this message translates to:
  /// **'Ошибка сервера'**
  String get serverError;

  /// Payment failed title
  ///
  /// In ru, this message translates to:
  /// **'Оплата не прошла'**
  String get paymentFailed;

  /// Open Kaspi button text
  ///
  /// In ru, this message translates to:
  /// **'Открыть Kaspi.kz'**
  String get openKaspi;

  /// Authorization page title
  ///
  /// In ru, this message translates to:
  /// **'Авторизация'**
  String get authorization;

  /// Phone number label
  ///
  /// In ru, this message translates to:
  /// **'Номер телефона'**
  String get phoneNumber;

  /// Phone number help text
  ///
  /// In ru, this message translates to:
  /// **'Поможет создавать и отслеживать\nваши заказы'**
  String get phoneNumberHelpText;

  /// Phone number input placeholder
  ///
  /// In ru, this message translates to:
  /// **'+7 (777) 123-45-65'**
  String get phoneNumberHint;

  /// Enter phone number error
  ///
  /// In ru, this message translates to:
  /// **'Введите номер телефона'**
  String get enterPhoneNumberError;

  /// Enter valid phone number error
  ///
  /// In ru, this message translates to:
  /// **'Введите корректный номер телефона'**
  String get enterValidPhoneNumber;

  /// Get verification code button
  ///
  /// In ru, this message translates to:
  /// **'Получить код'**
  String get getCode;

  /// Confirm code page title
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get confirmCode;

  /// SMS code title
  ///
  /// In ru, this message translates to:
  /// **'СМС код'**
  String get smsCode;

  /// SMS code help text
  ///
  /// In ru, this message translates to:
  /// **'Мы отправили 6 значный код по смс\nна номер {phone}'**
  String smsCodeHelpText(String phone);

  /// SMS code input label
  ///
  /// In ru, this message translates to:
  /// **'Код'**
  String get smsCodeLabel;

  /// SMS code input placeholder
  ///
  /// In ru, this message translates to:
  /// **'144 356'**
  String get smsCodeHint;

  /// Send button text
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get send;

  /// Code sent again message
  ///
  /// In ru, this message translates to:
  /// **'Код отправлен повторно'**
  String get codeSentAgain;

  /// Agreement prefix text
  ///
  /// In ru, this message translates to:
  /// **'Я ознакомился и согласен с'**
  String get iAgreeWith;

  /// Privacy policy link text
  ///
  /// In ru, this message translates to:
  /// **'политикой использования'**
  String get privacyPolicy;

  /// Conjunction 'and'
  ///
  /// In ru, this message translates to:
  /// **'и'**
  String get and;

  /// Terms of service link text
  ///
  /// In ru, this message translates to:
  /// **'условиями оферты'**
  String get termsOfService;

  /// Order label
  ///
  /// In ru, this message translates to:
  /// **'Заказ'**
  String get order;

  /// Order detail title
  ///
  /// In ru, this message translates to:
  /// **'Заказ {orderId}'**
  String orderDetail(String orderId);

  /// Delivery label
  ///
  /// In ru, this message translates to:
  /// **'Доставка'**
  String get delivery;

  /// Delivery date message
  ///
  /// In ru, this message translates to:
  /// **'Доставка в {date}'**
  String deliveryOn(String date);

  /// Parcel sent timeline step
  ///
  /// In ru, this message translates to:
  /// **'Посылка отправлена'**
  String get parcelSent;

  /// Processed at warehouse timeline step
  ///
  /// In ru, this message translates to:
  /// **'Обработан на складе'**
  String get processedAtWarehouse;

  /// Delivery to city timeline step
  ///
  /// In ru, this message translates to:
  /// **'Доставка в {city}'**
  String deliveryToCity(String city);

  /// Handed to courier timeline step
  ///
  /// In ru, this message translates to:
  /// **'Передано курьеру'**
  String get handedToCourier;

  /// Pay with amount button
  ///
  /// In ru, this message translates to:
  /// **'Оплатить {amount} тг'**
  String payWithAmount(String amount);

  /// Attach barcode button
  ///
  /// In ru, this message translates to:
  /// **'Привязать штрихкод'**
  String get attachBarcode;

  /// Cancel order button
  ///
  /// In ru, this message translates to:
  /// **'Отменить'**
  String get cancelOrder;

  /// Copy payment link button
  ///
  /// In ru, this message translates to:
  /// **'Скопировать ссылку на платеж'**
  String get copyPaymentLink;

  /// Payment link copied message
  ///
  /// In ru, this message translates to:
  /// **'Ссылка скопирована'**
  String get paymentLinkCopied;

  /// No orders yet message
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет заказов'**
  String get noOrdersYet;

  /// Create first order prompt
  ///
  /// In ru, this message translates to:
  /// **'Создайте свой первый заказ\nна главной странице'**
  String get createFirstOrder;

  /// Error occurred message
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get errorOccurred;

  /// Authorization required message
  ///
  /// In ru, this message translates to:
  /// **'Требуется авторизация'**
  String get authorizationRequired;

  /// Authorization required help text
  ///
  /// In ru, this message translates to:
  /// **'Для просмотра заказов\nнеобходимо войти в аккаунт'**
  String get authorizationRequiredHelp;

  /// Payment successful message
  ///
  /// In ru, this message translates to:
  /// **'Оплата прошла успешно!'**
  String get paymentSuccessful;

  /// Recipient section label
  ///
  /// In ru, this message translates to:
  /// **'Получатель'**
  String get recipientLabel;

  /// Delivery section label
  ///
  /// In ru, this message translates to:
  /// **'Доставка'**
  String get deliveryLabel;

  /// Processing payment message
  ///
  /// In ru, this message translates to:
  /// **'Обработка платежа...'**
  String get processingPayment;

  /// Please wait message
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, подождите'**
  String get pleaseWait;

  /// Add card prompt title
  ///
  /// In ru, this message translates to:
  /// **'Добавьте карту'**
  String get addCardPrompt;

  /// No saved cards message
  ///
  /// In ru, this message translates to:
  /// **'У вас пока нет сохраненных карт'**
  String get noSavedCards;

  /// Adding card page title
  ///
  /// In ru, this message translates to:
  /// **'Добавление карты'**
  String get addingCard;

  /// Try again button text
  ///
  /// In ru, this message translates to:
  /// **'Попробовать снова'**
  String get tryAgainButton;

  /// Payment for order title
  ///
  /// In ru, this message translates to:
  /// **'Оплата заказа №{orderId}'**
  String paymentForOrder(String orderId);

  /// Adding card bottom sheet title
  ///
  /// In ru, this message translates to:
  /// **'Добавление карты'**
  String get addingCardTitle;

  /// Not authorized message
  ///
  /// In ru, this message translates to:
  /// **'Вы не авторизованы'**
  String get notAuthorized;

  /// User role label
  ///
  /// In ru, this message translates to:
  /// **'Роль'**
  String get role;

  /// Name label
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// Email label
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get email;

  /// Logout from profile button
  ///
  /// In ru, this message translates to:
  /// **'Выйти из профиля'**
  String get logoutFromProfile;

  /// Delete profile request button
  ///
  /// In ru, this message translates to:
  /// **'Заявка на удаление профиля'**
  String get deleteProfileRequest;

  /// Delete profile in development message
  ///
  /// In ru, this message translates to:
  /// **'Функция удаления профиля в разработке'**
  String get deleteProfileInDevelopment;

  /// Logout dialog title
  ///
  /// In ru, this message translates to:
  /// **'Выход'**
  String get logoutTitle;

  /// Logout confirmation message
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите выйти?'**
  String get logoutConfirmation;

  /// Contacts page title
  ///
  /// In ru, this message translates to:
  /// **'Контакты'**
  String get contacts;

  /// Contact phone label
  ///
  /// In ru, this message translates to:
  /// **'Контактный телефон'**
  String get contactPhone;

  /// Mobile phone label
  ///
  /// In ru, this message translates to:
  /// **'Сотовый телефон'**
  String get mobilePhone;

  /// WhatsApp label
  ///
  /// In ru, this message translates to:
  /// **'Whatsapp'**
  String get whatsapp;

  /// Legal address label
  ///
  /// In ru, this message translates to:
  /// **'Юридический адрес'**
  String get legalAddress;

  /// Call button text
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get call;

  /// Write on WhatsApp button
  ///
  /// In ru, this message translates to:
  /// **'Написать в Whatsapp'**
  String get writeWhatsapp;

  /// App authentication settings label
  ///
  /// In ru, this message translates to:
  /// **'Авторизация в приложении'**
  String get appAuthSettings;

  /// App version information
  ///
  /// In ru, this message translates to:
  /// **'Sapsano {year} год. Версия {version}'**
  String appVersionInfo(String year, String version);

  /// Recipient data page title
  ///
  /// In ru, this message translates to:
  /// **'Данные получателя'**
  String get recipientData;

  /// Recipient contact info section title
  ///
  /// In ru, this message translates to:
  /// **'Контактная информация получателя'**
  String get recipientContactInfo;

  /// Recipient contact info help text
  ///
  /// In ru, this message translates to:
  /// **'Укажите имя и номер телефона получателя для связи'**
  String get recipientContactInfoHelp;

  /// Save data button
  ///
  /// In ru, this message translates to:
  /// **'Сохранить данные'**
  String get saveData;

  /// Description page title
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get description;

  /// Package description input label
  ///
  /// In ru, this message translates to:
  /// **'Описание посылки'**
  String get descriptionLabel;

  /// Save description button
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get saveDescription;

  /// Weight in kg field label
  ///
  /// In ru, this message translates to:
  /// **'Вес, в кг'**
  String get weightInKg;

  /// Address in city page title
  ///
  /// In ru, this message translates to:
  /// **'Адрес в {city}'**
  String addressIn(String city);

  /// Enter address placeholder
  ///
  /// In ru, this message translates to:
  /// **'Введите адрес...'**
  String get enterAddressPlaceholder;

  /// Searching addresses message
  ///
  /// In ru, this message translates to:
  /// **'Поиск адресов...'**
  String get searchingAddresses;

  /// Address search error message
  ///
  /// In ru, this message translates to:
  /// **'Ошибка поиска'**
  String get addressSearchError;

  /// Addresses not found message
  ///
  /// In ru, this message translates to:
  /// **'Адреса не найдены'**
  String get addressesNotFound;

  /// Try changing query suggestion
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить поисковый запрос'**
  String get tryChangingQuery;

  /// Start typing address prompt
  ///
  /// In ru, this message translates to:
  /// **'Начните вводить адрес'**
  String get startTypingAddress;

  /// Minimum two characters message
  ///
  /// In ru, this message translates to:
  /// **'Введите минимум 2 символа для поиска'**
  String get minTwoCharacters;

  /// Choose city alert message
  ///
  /// In ru, this message translates to:
  /// **'Выберите город'**
  String get chooseCity;

  /// Enter address alert message
  ///
  /// In ru, this message translates to:
  /// **'Введите адрес'**
  String get enterAddressField;

  /// City label
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get city;

  /// Address label
  ///
  /// In ru, this message translates to:
  /// **'Адрес'**
  String get address;

  /// Apartment label
  ///
  /// In ru, this message translates to:
  /// **'Квартира'**
  String get apartment;

  /// Apartment number placeholder
  ///
  /// In ru, this message translates to:
  /// **'Номер квартиры'**
  String get apartmentNumber;

  /// Entrance label
  ///
  /// In ru, this message translates to:
  /// **'Подъезд'**
  String get entrance;

  /// Entrance number placeholder
  ///
  /// In ru, this message translates to:
  /// **'Номер подъезда'**
  String get entranceNumber;

  /// Floor label
  ///
  /// In ru, this message translates to:
  /// **'Этаж'**
  String get floor;

  /// Floor number placeholder
  ///
  /// In ru, this message translates to:
  /// **'Номер этажа'**
  String get floorNumber;

  /// App language settings label
  ///
  /// In ru, this message translates to:
  /// **'Язык приложения'**
  String get appLanguage;

  /// Russian language
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get russian;

  /// English language
  ///
  /// In ru, this message translates to:
  /// **'English'**
  String get english;

  /// Kazakh language
  ///
  /// In ru, this message translates to:
  /// **'Қазақша'**
  String get kazakh;

  /// Notification settings label
  ///
  /// In ru, this message translates to:
  /// **'Настройка уведомлений'**
  String get notificationSettings;

  /// Privacy policy title
  ///
  /// In ru, this message translates to:
  /// **'Политика пользования'**
  String get privacyPolicyTitle;

  /// Terms of service title
  ///
  /// In ru, this message translates to:
  /// **'Условия оферты'**
  String get termsOfServiceTitle;

  /// For legal entities link
  ///
  /// In ru, this message translates to:
  /// **'Для юридических лиц'**
  String get forLegalEntities;

  /// Transportation rules link
  ///
  /// In ru, this message translates to:
  /// **'Правила перевозки'**
  String get transportationRules;

  /// Add photo button text
  ///
  /// In ru, this message translates to:
  /// **'Добавить\nфото'**
  String get addPhoto;

  /// Select source bottom sheet title
  ///
  /// In ru, this message translates to:
  /// **'Выберите источник'**
  String get selectSource;

  /// Camera option
  ///
  /// In ru, this message translates to:
  /// **'Камера'**
  String get camera;

  /// Gallery option
  ///
  /// In ru, this message translates to:
  /// **'Галерея'**
  String get gallery;

  /// Package photos title
  ///
  /// In ru, this message translates to:
  /// **'Фото упаковки'**
  String get packagePhotos;

  /// Selected photos count
  ///
  /// In ru, this message translates to:
  /// **'Выбранные фото ({count})'**
  String selectedPhotosCount(int count);

  /// Photo upload error message
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при загрузке фото'**
  String get photoUploadError;

  /// Photo selection error message
  ///
  /// In ru, this message translates to:
  /// **'Ошибка при выборе фото'**
  String get photoSelectionError;

  /// Order status: created
  ///
  /// In ru, this message translates to:
  /// **'Создан'**
  String get orderStatusCreated;

  /// Order status: cancelled
  ///
  /// In ru, this message translates to:
  /// **'Отменен'**
  String get orderStatusCancelled;

  /// Order status: decided/rejected by courier
  ///
  /// In ru, this message translates to:
  /// **'Отклонен курьером'**
  String get orderStatusDecided;

  /// Order status: accepted, waiting for courier
  ///
  /// In ru, this message translates to:
  /// **'Ожидаем курьера'**
  String get orderStatusAccepted;

  /// Order status: processing at warehouse
  ///
  /// In ru, this message translates to:
  /// **'Обработка на складе'**
  String get orderStatusProcessing;

  /// Order status: delivery to city
  ///
  /// In ru, this message translates to:
  /// **'Доставка в Астану'**
  String get orderStatusDeliveryToCity;

  /// Order status: handed to courier for delivery
  ///
  /// In ru, this message translates to:
  /// **'Передано курьеру'**
  String get orderStatusHandedToCourierShort;

  /// Order status: completed/delivered
  ///
  /// In ru, this message translates to:
  /// **'Доставлен'**
  String get orderStatusCompleted;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
