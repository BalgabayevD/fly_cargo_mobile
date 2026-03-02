String unmaskPhone(String? phone) {
  if (phone == null) return '';
  return phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
}

String formatOrderId(int number) {
  String numStr = number.toString().padLeft(9, '0');
  return '${numStr.substring(0, 3)}-${numStr.substring(3, 6)}-${numStr.substring(6, 9)}';
}
