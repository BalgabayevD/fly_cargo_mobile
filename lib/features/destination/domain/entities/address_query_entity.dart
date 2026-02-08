import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_query_entity.freezed.dart';
part 'address_query_entity.g.dart';

@freezed
sealed class AddressQueryEntity with _$AddressQueryEntity {
  const factory AddressQueryEntity({
    required String title,
  }) = _AddressQueryEntity;

  factory AddressQueryEntity.fromJson(Map<String, Object?> json) =>
      _$AddressQueryEntityFromJson(json);
}
