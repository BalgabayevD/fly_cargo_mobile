// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Sapsano';

  @override
  String get success => 'Сәтті';

  @override
  String get error => 'Қате';

  @override
  String get loading => 'Жүктелуде...';

  @override
  String get retry => 'Қайталау';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get save => 'Сақтау';

  @override
  String get delete => 'Жою';

  @override
  String get back => 'Артқа';

  @override
  String get next => 'Келесі';

  @override
  String get done => 'Дайын';

  @override
  String get close => 'Жабу';

  @override
  String get phoneInputHint => '+7 (XXX) XXX-XX-XX';

  @override
  String get enterPhoneNumber => 'Телефон нөмірін енгізіңіз';

  @override
  String get enterCode => 'Кодты енгізіңіз';

  @override
  String codeSentTo(String phone) {
    return 'Код $phone нөміріне жіберілді';
  }

  @override
  String get resendCode => 'Кодты қайта жіберу';

  @override
  String resendCodeIn(int seconds) {
    return 'Қайта жіберу $seconds сек кейін';
  }

  @override
  String get orderCreated => 'Жөнелту өтінімі жасалды';

  @override
  String get goToOrders => 'Тапсырыстарға өту';

  @override
  String get paymentError => 'Төлем қатесі';

  @override
  String get paymentErrorMessage =>
      'Төлем кезінде қате орын алды. Қайталап көріңіз.';

  @override
  String get pay => 'Төлеу';

  @override
  String payAmount(String amount) {
    return '$amount төлеу';
  }

  @override
  String get addCard => 'Карта қосу';

  @override
  String get selectCard => 'Картаны таңдаңыз';

  @override
  String get noCards => 'Сақталған карталар жоқ';

  @override
  String get packageDescription => 'Жөнелтілім сипаттамасы';

  @override
  String get describePackageContents => 'Жөнелтілім мазмұнын сипаттаңыз';

  @override
  String get enterPackageDescription => 'Жөнелтілім сипаттамасын енгізіңіз';

  @override
  String get sender => 'Жіберуші';

  @override
  String get recipient => 'Алушы';

  @override
  String get recipientName => 'Алушының аты';

  @override
  String get recipientPhone => 'Алушының телефоны';

  @override
  String get enterRecipientName => 'Алушының атын енгізіңіз';

  @override
  String get enterRecipientPhone => 'Алушының телефонын енгізіңіз';

  @override
  String get from => 'Қайдан';

  @override
  String get to => 'Қайда';

  @override
  String get selectCity => 'Қаланы таңдаңыз';

  @override
  String get selectAddress => 'Мекенжайды таңдаңыз';

  @override
  String get searchAddress => 'Мекенжай іздеу';

  @override
  String get noAddressFound => 'Мекенжай табылмады';

  @override
  String get selectTariff => 'Тарифті таңдаңыз';

  @override
  String get dimensions => 'Өлшемдері';

  @override
  String get weight => 'Салмағы';

  @override
  String weightKg(String weight) {
    return '$weight кг';
  }

  @override
  String get length => 'Ұзындығы';

  @override
  String get width => 'Ені';

  @override
  String get height => 'Биіктігі';

  @override
  String get cm => 'см';

  @override
  String get kg => 'кг';

  @override
  String get createOrder => 'Тапсырыс жасау';

  @override
  String get orders => 'Тапсырыстар';

  @override
  String get myOrders => 'Менің тапсырыстарым';

  @override
  String get noOrders => 'Тапсырыстар жоқ';

  @override
  String orderNumber(String number) {
    return '№$number тапсырыс';
  }

  @override
  String get orderStatus => 'Тапсырыс күйі';

  @override
  String get statusPending => 'Күтуде';

  @override
  String get statusProcessing => 'Өңделуде';

  @override
  String get statusInTransit => 'Жолда';

  @override
  String get statusDelivered => 'Жеткізілді';

  @override
  String get statusCancelled => 'Бас тартылды';

  @override
  String get deliveryDate => 'Жеткізу күні';

  @override
  String expectedDelivery(String date) {
    return 'Күтілетін жеткізу: $date';
  }

  @override
  String get profile => 'Профиль';

  @override
  String get settings => 'Баптаулар';

  @override
  String get logout => 'Шығу';

  @override
  String get deleteAccount => 'Аккаунтты жою';

  @override
  String get deleteAccountConfirm =>
      'Аккаунтты жойғыңыз келетініне сенімдісіз бе?';

  @override
  String get featureInDevelopment => 'Функция әзірлену үстінде';

  @override
  String get share => 'Бөлісу';

  @override
  String get openInMaps => 'Картада ашу';

  @override
  String get accept => 'Қабылдау';

  @override
  String get decline => 'Бас тарту';

  @override
  String get home => 'Басты бет';

  @override
  String get total => 'Барлығы';

  @override
  String get price => 'Бағасы';

  @override
  String priceAmount(String amount) {
    return '$amount ₸';
  }

  @override
  String get continue_ => 'Жалғастыру';

  @override
  String get confirm => 'Растау';

  @override
  String get enterComment => 'Түсініктеме енгізіңіз';

  @override
  String get comment => 'Түсініктеме';

  @override
  String get optional => 'Міндетті емес';

  @override
  String get required => 'Міндетті';

  @override
  String get fieldRequired => 'Бұл өріс міндетті';

  @override
  String get invalidPhoneNumber => 'Телефон нөмірі дұрыс емес';

  @override
  String get somethingWentWrong => 'Бірдеңе дұрыс болмады';

  @override
  String get tryAgain => 'Қайталап көріңіз';

  @override
  String get noInternetConnection => 'Интернет байланысы жоқ';

  @override
  String get serverError => 'Сервер қатесі';

  @override
  String get paymentFailed => 'Төлем өтпеді';

  @override
  String get openKaspi => 'Kaspi.kz ашу';
}
