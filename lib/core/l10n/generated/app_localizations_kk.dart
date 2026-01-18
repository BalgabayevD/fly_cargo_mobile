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
  String orderNumber(String orderId) {
    return '№$orderId тапсырыс';
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

  @override
  String get authorization => 'Авторизация';

  @override
  String get phoneNumber => 'Телефон нөмірі';

  @override
  String get phoneNumberHelpText =>
      'Тапсырыстарды жасауға және\nқадағалауға көмектеседі';

  @override
  String get phoneNumberHint => '+7 (777) 123-45-65';

  @override
  String get enterPhoneNumberError => 'Телефон нөмірін енгізіңіз';

  @override
  String get enterValidPhoneNumber => 'Дұрыс телефон нөмірін енгізіңіз';

  @override
  String get getCode => 'Код алу';

  @override
  String get confirmCode => 'Растау';

  @override
  String get smsCode => 'СМС код';

  @override
  String smsCodeHelpText(String phone) {
    return 'Біз 6 таңбалы кодты SMS арқылы жібердік\n$phone нөміріне';
  }

  @override
  String get smsCodeLabel => 'Код';

  @override
  String get smsCodeHint => '144 356';

  @override
  String get send => 'Жіберу';

  @override
  String get codeSentAgain => 'Код қайта жіберілді';

  @override
  String get iAgreeWith => 'Мен танысып, келісемін';

  @override
  String get privacyPolicy => 'құпиялылық саясатымен';

  @override
  String get and => 'және';

  @override
  String get termsOfService => 'оферта шарттарымен';

  @override
  String get order => 'Тапсырыс';

  @override
  String orderDetail(String orderId) {
    return '№$orderId тапсырыс';
  }

  @override
  String get delivery => 'Жеткізу';

  @override
  String deliveryOn(String date) {
    return '$date жеткізу';
  }

  @override
  String get parcelSent => 'Жөнелтілім жіберілді';

  @override
  String get processedAtWarehouse => 'Қоймада өңделді';

  @override
  String deliveryToCity(String city) {
    return '$city жеткізу';
  }

  @override
  String get handedToCourier => 'Курьерге тапсырылды';

  @override
  String payWithAmount(String amount) {
    return '$amount тг төлеу';
  }

  @override
  String get attachBarcode => 'Штрихкодты байлау';

  @override
  String get cancelOrder => 'Болдырмау';

  @override
  String get copyPaymentLink => 'Төлем сілтемесін көшіру';

  @override
  String get paymentLinkCopied => 'Сілтеме көшірілді';

  @override
  String get noOrdersYet => 'Сізде әлі тапсырыстар жоқ';

  @override
  String get createFirstOrder => 'Бірінші тапсырысты\nбасты бетте жасаңыз';

  @override
  String get errorOccurred => 'Қате орын алды';

  @override
  String get authorizationRequired => 'Авторизация қажет';

  @override
  String get authorizationRequiredHelp =>
      'Тапсырыстарды көру үшін\nаккаунтқа кіру керек';

  @override
  String get paymentSuccessful => 'Төлем сәтті өтті!';

  @override
  String get recipientLabel => 'Алушы';

  @override
  String get deliveryLabel => 'Жеткізу';

  @override
  String get processingPayment => 'Төлем өңделуде...';

  @override
  String get pleaseWait => 'Күте тұрыңыз';

  @override
  String get addCardPrompt => 'Карта қосыңыз';

  @override
  String get noSavedCards => 'Сізде әлі сақталған карталар жоқ';

  @override
  String get addingCard => 'Карта қосу';

  @override
  String get tryAgainButton => 'Қайталап көріңіз';

  @override
  String paymentForOrder(String orderId) {
    return '№$orderId тапсырысқа төлем';
  }

  @override
  String get addingCardTitle => 'Карта қосу';

  @override
  String get notAuthorized => 'Сіз авторизацияланбағансыз';

  @override
  String get role => 'Рөл';

  @override
  String get name => 'Аты';

  @override
  String get email => 'Email';

  @override
  String get logoutFromProfile => 'Профильден шығу';

  @override
  String get deleteProfileRequest => 'Профильді жою өтініші';

  @override
  String get deleteProfileInDevelopment => 'Профильді жою функциясы әзірленуде';

  @override
  String get logoutTitle => 'Шығу';

  @override
  String get logoutConfirmation => 'Шығуға сенімдісіз бе?';

  @override
  String get contacts => 'Байланыстар';

  @override
  String get contactPhone => 'Байланыс телефоны';

  @override
  String get mobilePhone => 'Ұялы телефон';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get legalAddress => 'Заңды мекенжайы';

  @override
  String get call => 'Қоңырау шалу';

  @override
  String get writeWhatsapp => 'WhatsApp-қа жазу';

  @override
  String get appAuthSettings => 'Қолданбада авторизация';

  @override
  String appVersionInfo(String year, String version) {
    return 'Sapsano $year жыл. Нұсқа $version';
  }

  @override
  String get recipientData => 'Алушы деректері';

  @override
  String get recipientContactInfo => 'Алушының байланыс ақпараты';

  @override
  String get recipientContactInfoHelp =>
      'Байланыс үшін алушының атын және телефон нөмірін енгізіңіз';

  @override
  String get saveData => 'Деректерді сақтау';

  @override
  String get description => 'Сипаттама';

  @override
  String get descriptionLabel => 'Жөнелтілім сипаттамасы';

  @override
  String get saveDescription => 'Сақтау';

  @override
  String get weightInKg => 'Салмағы, кг';

  @override
  String addressIn(String city) {
    return '$city мекенжайы';
  }

  @override
  String get enterAddressPlaceholder => 'Мекенжайды енгізіңіз...';

  @override
  String get searchingAddresses => 'Мекенжайлар іздеу...';

  @override
  String get addressSearchError => 'Іздеу қатесі';

  @override
  String get addressesNotFound => 'Мекенжайлар табылмады';

  @override
  String get tryChangingQuery => 'Іздеу сұрауын өзгертіп көріңіз';

  @override
  String get startTypingAddress => 'Мекенжайды теруді бастаңыз';

  @override
  String get minTwoCharacters => 'Іздеу үшін кемінде 2 таңба енгізіңіз';

  @override
  String get chooseCity => 'Қаланы таңдаңыз';

  @override
  String get enterAddressField => 'Мекенжайды енгізіңіз';

  @override
  String get city => 'Қала';

  @override
  String get address => 'Мекенжай';

  @override
  String get apartment => 'Пәтер';

  @override
  String get apartmentNumber => 'Пәтер нөмірі';

  @override
  String get entrance => 'Кіреберіс';

  @override
  String get entranceNumber => 'Кіреберіс нөмірі';

  @override
  String get floor => 'Қабат';

  @override
  String get floorNumber => 'Қабат нөмірі';

  @override
  String get appLanguage => 'Қолданба тілі';

  @override
  String get russian => 'Орысша';

  @override
  String get english => 'Ағылшынша';

  @override
  String get kazakh => 'Қазақша';

  @override
  String get notificationSettings => 'Хабарландыруларды баптау';

  @override
  String get privacyPolicyTitle => 'Пайдалану саясаты';

  @override
  String get termsOfServiceTitle => 'Оферта шарттары';

  @override
  String get forLegalEntities => 'Заңды тұлғаларға';

  @override
  String get transportationRules => 'Тасымалдау ережелері';

  @override
  String get addPhoto => 'Фото\nқосу';

  @override
  String get selectSource => 'Көзді таңдаңыз';

  @override
  String get camera => 'Камера';

  @override
  String get gallery => 'Галерея';

  @override
  String get packagePhotos => 'Қаптама фотосы';

  @override
  String selectedPhotosCount(int count) {
    return 'Таңдалған фотолар ($count)';
  }

  @override
  String get photoUploadError => 'Фото жүктеу қатесі';

  @override
  String get photoSelectionError => 'Фото таңдау қатесі';

  @override
  String get orderStatusCreated => 'Жасалды';

  @override
  String get orderStatusCancelled => 'Бас тартылды';

  @override
  String get orderStatusDecided => 'Курьер бас тартты';

  @override
  String get orderStatusAccepted => 'Курьерді күтуде';

  @override
  String get orderStatusProcessing => 'Қоймада өңделуде';

  @override
  String get orderStatusDeliveryToCity => 'Астанаға жеткізу';

  @override
  String get orderStatusHandedToCourierShort => 'Курьерге берілді';

  @override
  String get orderStatusCompleted => 'Жеткізілді';

  @override
  String get learnAllowedProducts => 'Рұқсат етілген тауарларды білу керек пе?';

  @override
  String get dangerousGoods => 'Қауіпті жүктер';

  @override
  String get explosiveMaterials => 'Жарылғыш материалдар,\nотшашқылар';

  @override
  String get compressedGases => 'Сығылған газдар';

  @override
  String get oxidizingSubstances => 'Тотықтырғыш заттар';

  @override
  String trackingNumber(String number) {
    return 'Трек нөмірі $number';
  }

  @override
  String orderCost(String amount) {
    return 'Құны: $amount тг';
  }

  @override
  String get user => 'Пайдаланушы';

  @override
  String get firstName => 'Аты';

  @override
  String get lastName => 'Тегі';

  @override
  String get middleName => 'Әкесінің аты';

  @override
  String get birthDate => 'Туған күні';
}
