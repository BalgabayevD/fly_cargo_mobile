String unmaskPhone(String? phone) {
  if (phone == null) return "";
  return phone.replaceAll('(', '').replaceAll(')', '').replaceAll(' ', '');
}
