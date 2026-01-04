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
  String orderNumber(String number) {
    return 'Order #$number';
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
}
