String unmaskPhone(String? phone) {
  if (phone == null) return '';
  return phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
}

String formatOrderId(int number) {
  String numStr = number.toString().padLeft(11, '0');

  return '${numStr[0]}-${numStr.substring(1, 4)}-${numStr.substring(4, 7)}-${numStr.substring(7, 11)}';
}
