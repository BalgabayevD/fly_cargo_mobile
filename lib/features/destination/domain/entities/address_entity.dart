import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_entity.freezed.dart';

@freezed
sealed class AddressEntity with _$AddressEntity {
  const AddressEntity._();

  const factory AddressEntity({
    required String city,
    required String address,
    required String cityId,
    String? fullAddress,
    String? apartment,
    String? entrance,
    String? floor,
  }) = _AddressEntity;

  String get displayText {
    if (fullAddress != null) {
      return fullAddress!;
    }
    return '$city, $address';
  }
}
