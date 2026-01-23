// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardEntity {

 int get id; String get mask; String get type; String get bank; String get image;
/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardEntityCopyWith<CardEntity> get copyWith => _$CardEntityCopyWithImpl<CardEntity>(this as CardEntity, _$identity);

  /// Serializes this CardEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mask, mask) || other.mask == mask)&&(identical(other.type, type) || other.type == type)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mask,type,bank,image);

@override
String toString() {
  return 'CardEntity(id: $id, mask: $mask, type: $type, bank: $bank, image: $image)';
}


}

/// @nodoc
abstract mixin class $CardEntityCopyWith<$Res>  {
  factory $CardEntityCopyWith(CardEntity value, $Res Function(CardEntity) _then) = _$CardEntityCopyWithImpl;
@useResult
$Res call({
 int id, String mask, String type, String bank, String image
});




}
/// @nodoc
class _$CardEntityCopyWithImpl<$Res>
    implements $CardEntityCopyWith<$Res> {
  _$CardEntityCopyWithImpl(this._self, this._then);

  final CardEntity _self;
  final $Res Function(CardEntity) _then;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mask = null,Object? type = null,Object? bank = null,Object? image = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mask: null == mask ? _self.mask : mask // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,bank: null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardEntity].
extension CardEntityPatterns on CardEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardEntity value)  $default,){
final _that = this;
switch (_that) {
case _CardEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CardEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String mask,  String type,  String bank,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardEntity() when $default != null:
return $default(_that.id,_that.mask,_that.type,_that.bank,_that.image);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String mask,  String type,  String bank,  String image)  $default,) {final _that = this;
switch (_that) {
case _CardEntity():
return $default(_that.id,_that.mask,_that.type,_that.bank,_that.image);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String mask,  String type,  String bank,  String image)?  $default,) {final _that = this;
switch (_that) {
case _CardEntity() when $default != null:
return $default(_that.id,_that.mask,_that.type,_that.bank,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardEntity implements CardEntity {
  const _CardEntity({required this.id, required this.mask, required this.type, required this.bank, required this.image});
  factory _CardEntity.fromJson(Map<String, dynamic> json) => _$CardEntityFromJson(json);

@override final  int id;
@override final  String mask;
@override final  String type;
@override final  String bank;
@override final  String image;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardEntityCopyWith<_CardEntity> get copyWith => __$CardEntityCopyWithImpl<_CardEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.mask, mask) || other.mask == mask)&&(identical(other.type, type) || other.type == type)&&(identical(other.bank, bank) || other.bank == bank)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mask,type,bank,image);

@override
String toString() {
  return 'CardEntity(id: $id, mask: $mask, type: $type, bank: $bank, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CardEntityCopyWith<$Res> implements $CardEntityCopyWith<$Res> {
  factory _$CardEntityCopyWith(_CardEntity value, $Res Function(_CardEntity) _then) = __$CardEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String mask, String type, String bank, String image
});




}
/// @nodoc
class __$CardEntityCopyWithImpl<$Res>
    implements _$CardEntityCopyWith<$Res> {
  __$CardEntityCopyWithImpl(this._self, this._then);

  final _CardEntity _self;
  final $Res Function(_CardEntity) _then;

/// Create a copy of CardEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mask = null,Object? type = null,Object? bank = null,Object? image = null,}) {
  return _then(_CardEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mask: null == mask ? _self.mask : mask // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,bank: null == bank ? _self.bank : bank // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
