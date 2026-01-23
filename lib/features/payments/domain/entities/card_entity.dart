import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';
part 'card_entity.g.dart';

@freezed
abstract class CardEntity with _$CardEntity {
  const factory CardEntity({
    required int id,
    required String mask,
    required String type,
    required String bank,
    required String image,
  }) = _CardEntity;

  factory CardEntity.fromJson(Map<String, Object?> json) =>
      _$CardEntityFromJson(json);
}
