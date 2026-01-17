// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Sapsano';

  @override
  String get success => 'Success';

  @override
  String get error => 'Error';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get done => 'Done';

  @override
  String get close => 'Close';

  @override
  String get phoneInputHint => '+7 (XXX) XXX-XX-XX';

  @override
  String get enterPhoneNumber => 'Enter phone number';

  @override
  String get enterCode => 'Enter code';

  @override
  String codeSentTo(String phone) {
    return 'Code sent to $phone';
  }

  @override
  String get resendCode => 'Resend code';

  @override
  String resendCodeIn(int seconds) {
    return 'Resend in $seconds sec';
  }

  @override
  String get orderCreated => 'Your shipment request has been created';

  @override
  String get goToOrders => 'Go to orders';

  @override
  String get paymentError => 'Payment error';

  @override
  String get paymentErrorMessage =>
      'An error occurred during payment. Please try again.';

  @override
  String get pay => 'Pay';

  @override
  String payAmount(String amount) {
    return 'Pay $amount';
  }

  @override
  String get addCard => 'Add card';

  @override
  String get selectCard => 'Select card';

  @override
  String get noCards => 'No saved cards';

  @override
  String get packageDescription => 'Package description';

  @override
  String get describePackageContents => 'Describe package contents';

  @override
  String get enterPackageDescription => 'Enter package description';

  @override
  String get sender => 'Sender';

  @override
  String get recipient => 'Recipient';

  @override
  String get recipientName => 'Recipient name';

  @override
  String get recipientPhone => 'Recipient phone';

  @override
  String get enterRecipientName => 'Enter recipient name';

  @override
  String get enterRecipientPhone => 'Enter recipient phone';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get selectCity => 'Select city';

  @override
  String get selectAddress => 'Select address';

  @override
  String get searchAddress => 'Search address';

  @override
  String get noAddressFound => 'Address not found';

  @override
  String get selectTariff => 'Select tariff';

  @override
  String get dimensions => 'Dimensions';

  @override
  String get weight => 'Weight';

  @override
  String weightKg(String weight) {
    return '$weight kg';
  }

  @override
  String get length => 'Length';

  @override
  String get width => 'Width';

  @override
  String get height => 'Height';

  @override
  String get cm => 'cm';

  @override
  String get kg => 'kg';

  @override
  String get createOrder => 'Create order';

  @override
  String get orders => 'Orders';

  @override
  String get myOrders => 'My orders';

  @override
  String get noOrders => 'No orders';

  @override
  String orderNumber(String orderId) {
    return 'Order $orderId';
  }

  @override
  String get orderStatus => 'Order status';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusProcessing => 'Processing';

  @override
  String get statusInTransit => 'In transit';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get deliveryDate => 'Delivery date';

  @override
  String expectedDelivery(String date) {
    return 'Expected delivery: $date';
  }

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Log out';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountConfirm =>
      'Are you sure you want to delete your account?';

  @override
  String get featureInDevelopment => 'Feature in development';

  @override
  String get share => 'Share';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get accept => 'Accept';

  @override
  String get decline => 'Decline';

  @override
  String get home => 'Home';

  @override
  String get total => 'Total';

  @override
  String get price => 'Price';

  @override
  String priceAmount(String amount) {
    return '$amount ₸';
  }

  @override
  String get continue_ => 'Continue';

  @override
  String get confirm => 'Confirm';

  @override
  String get enterComment => 'Enter comment';

  @override
  String get comment => 'Comment';

  @override
  String get optional => 'Optional';

  @override
  String get required => 'Required';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidPhoneNumber => 'Invalid phone number';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get tryAgain => 'Try again';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get serverError => 'Server error';

  @override
  String get paymentFailed => 'Payment failed';

  @override
  String get openKaspi => 'Open Kaspi.kz';

  @override
  String get authorization => 'Authorization';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get phoneNumberHelpText => 'Helps to create and track\nyour orders';

  @override
  String get phoneNumberHint => '+7 (777) 123-45-65';

  @override
  String get enterPhoneNumberError => 'Enter phone number';

  @override
  String get enterValidPhoneNumber => 'Enter valid phone number';

  @override
  String get getCode => 'Get code';

  @override
  String get confirmCode => 'Confirm';

  @override
  String get smsCode => 'SMS code';

  @override
  String smsCodeHelpText(String phone) {
    return 'We sent a 6-digit code via SMS\nto $phone';
  }

  @override
  String get smsCodeLabel => 'Code';

  @override
  String get smsCodeHint => '144 356';

  @override
  String get send => 'Send';

  @override
  String get codeSentAgain => 'Code sent again';

  @override
  String get iAgreeWith => 'I have read and agree to';

  @override
  String get privacyPolicy => 'privacy policy';

  @override
  String get and => 'and';

  @override
  String get termsOfService => 'terms of service';

  @override
  String get order => 'Order';

  @override
  String orderDetail(String orderId) {
    return 'Order $orderId';
  }

  @override
  String get delivery => 'Delivery';

  @override
  String deliveryOn(String date) {
    return 'Delivery on $date';
  }

  @override
  String get parcelSent => 'Parcel sent';

  @override
  String get processedAtWarehouse => 'Processed at warehouse';

  @override
  String deliveryToCity(String city) {
    return 'Delivery to $city';
  }

  @override
  String get handedToCourier => 'Handed to courier';

  @override
  String payWithAmount(String amount) {
    return 'Pay $amount tg';
  }

  @override
  String get attachBarcode => 'Attach barcode';

  @override
  String get cancelOrder => 'Cancel';

  @override
  String get copyPaymentLink => 'Copy payment link';

  @override
  String get paymentLinkCopied => 'Link copied';

  @override
  String get noOrdersYet => 'You don\'t have any orders yet';

  @override
  String get createFirstOrder => 'Create your first order\non the home page';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get authorizationRequired => 'Authorization required';

  @override
  String get authorizationRequiredHelp => 'Please log in to view\nyour orders';

  @override
  String get paymentSuccessful => 'Payment successful!';

  @override
  String get recipientLabel => 'Recipient';

  @override
  String get deliveryLabel => 'Delivery';

  @override
  String get processingPayment => 'Processing payment...';

  @override
  String get pleaseWait => 'Please wait';

  @override
  String get addCardPrompt => 'Add a card';

  @override
  String get noSavedCards => 'You don\'t have any saved cards yet';

  @override
  String get addingCard => 'Adding card';

  @override
  String get tryAgainButton => 'Try again';

  @override
  String paymentForOrder(String orderId) {
    return 'Payment for order #$orderId';
  }

  @override
  String get addingCardTitle => 'Adding card';

  @override
  String get notAuthorized => 'You are not authorized';

  @override
  String get role => 'Role';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get logoutFromProfile => 'Log out';

  @override
  String get deleteProfileRequest => 'Delete profile request';

  @override
  String get deleteProfileInDevelopment =>
      'Delete profile feature in development';

  @override
  String get logoutTitle => 'Log out';

  @override
  String get logoutConfirmation => 'Are you sure you want to log out?';

  @override
  String get contacts => 'Contacts';

  @override
  String get contactPhone => 'Contact phone';

  @override
  String get mobilePhone => 'Mobile phone';

  @override
  String get whatsapp => 'WhatsApp';

  @override
  String get legalAddress => 'Legal address';

  @override
  String get call => 'Call';

  @override
  String get writeWhatsapp => 'Write on WhatsApp';

  @override
  String get appAuthSettings => 'App authentication';

  @override
  String appVersionInfo(String year, String version) {
    return 'Sapsano $year. Version $version';
  }

  @override
  String get recipientData => 'Recipient data';

  @override
  String get recipientContactInfo => 'Recipient contact information';

  @override
  String get recipientContactInfoHelp =>
      'Enter recipient name and phone number for contact';

  @override
  String get saveData => 'Save data';

  @override
  String get description => 'Description';

  @override
  String get descriptionLabel => 'Package description';

  @override
  String get saveDescription => 'Save';

  @override
  String get weightInKg => 'Weight, kg';

  @override
  String addressIn(String city) {
    return 'Address in $city';
  }

  @override
  String get enterAddressPlaceholder => 'Enter address...';

  @override
  String get searchingAddresses => 'Searching addresses...';

  @override
  String get addressSearchError => 'Search error';

  @override
  String get addressesNotFound => 'Addresses not found';

  @override
  String get tryChangingQuery => 'Try changing your search query';

  @override
  String get startTypingAddress => 'Start typing address';

  @override
  String get minTwoCharacters => 'Enter at least 2 characters to search';

  @override
  String get chooseCity => 'Choose city';

  @override
  String get enterAddressField => 'Enter address';

  @override
  String get city => 'City';

  @override
  String get address => 'Address';

  @override
  String get apartment => 'Apartment';

  @override
  String get apartmentNumber => 'Apartment number';

  @override
  String get entrance => 'Entrance';

  @override
  String get entranceNumber => 'Entrance number';

  @override
  String get floor => 'Floor';

  @override
  String get floorNumber => 'Floor number';

  @override
  String get appLanguage => 'App language';

  @override
  String get russian => 'Russian';

  @override
  String get english => 'English';

  @override
  String get kazakh => 'Kazakh';

  @override
  String get notificationSettings => 'Notification settings';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get termsOfServiceTitle => 'Terms of service';

  @override
  String get forLegalEntities => 'For legal entities';

  @override
  String get transportationRules => 'Transportation rules';

  @override
  String get addPhoto => 'Add\nphoto';

  @override
  String get selectSource => 'Select source';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get packagePhotos => 'Package photos';

  @override
  String selectedPhotosCount(int count) {
    return 'Selected photos ($count)';
  }

  @override
  String get photoUploadError => 'Error uploading photo';

  @override
  String get photoSelectionError => 'Error selecting photo';

  @override
  String get orderStatusCreated => 'Created';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get orderStatusDecided => 'Rejected by courier';

  @override
  String get orderStatusAccepted => 'Waiting for courier';

  @override
  String get orderStatusProcessing => 'Processing at warehouse';

  @override
  String get orderStatusDeliveryToCity => 'Delivery to Astana';

  @override
  String get orderStatusHandedToCourierShort => 'Handed to courier';

  @override
  String get orderStatusCompleted => 'Delivered';

  @override
  String get learnAllowedProducts => 'Learn which products are allowed?';

  @override
  String get dangerousGoods => 'Dangerous Goods';

  @override
  String get explosiveMaterials => 'Explosive materials,\nfireworks';

  @override
  String get compressedGases => 'Compressed gases';

  @override
  String get oxidizingSubstances => 'Oxidizing substances';

  @override
  String trackingNumber(String number) {
    return 'Tracking number $number';
  }

  @override
  String orderCost(String amount) {
    return 'Cost: $amount tg';
  }

  @override
  String get user => 'User';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get middleName => 'Middle name';

  @override
  String get birthDate => 'Birth date';
}
