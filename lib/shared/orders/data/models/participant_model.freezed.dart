// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'participant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParticipantModel {

 int? get id; String get createdAt; String get updatedAt; String? get deletedAt; int? get orderId; String? get userId; UserModel? get user; String get target;
/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParticipantModelCopyWith<ParticipantModel> get copyWith => _$ParticipantModelCopyWithImpl<ParticipantModel>(this as ParticipantModel, _$identity);

  /// Serializes this ParticipantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,orderId,userId,user,target);

@override
String toString() {
  return 'ParticipantModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, orderId: $orderId, userId: $userId, user: $user, target: $target)';
}


}

/// @nodoc
abstract mixin class $ParticipantModelCopyWith<$Res>  {
  factory $ParticipantModelCopyWith(ParticipantModel value, $Res Function(ParticipantModel) _then) = _$ParticipantModelCopyWithImpl;
@useResult
$Res call({
 int? id, String createdAt, String updatedAt, String? deletedAt, int? orderId, String? userId, UserModel? user, String target
});


$UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$ParticipantModelCopyWithImpl<$Res>
    implements $ParticipantModelCopyWith<$Res> {
  _$ParticipantModelCopyWithImpl(this._self, this._then);

  final ParticipantModel _self;
  final $Res Function(ParticipantModel) _then;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? orderId = freezed,Object? userId = freezed,Object? user = freezed,Object? target = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [ParticipantModel].
extension ParticipantModelPatterns on ParticipantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParticipantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParticipantModel value)  $default,){
final _that = this;
switch (_that) {
case _ParticipantModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParticipantModel value)?  $default,){
final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  int? orderId,  String? userId,  UserModel? user,  String target)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.userId,_that.user,_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  int? orderId,  String? userId,  UserModel? user,  String target)  $default,) {final _that = this;
switch (_that) {
case _ParticipantModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.userId,_that.user,_that.target);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String createdAt,  String updatedAt,  String? deletedAt,  int? orderId,  String? userId,  UserModel? user,  String target)?  $default,) {final _that = this;
switch (_that) {
case _ParticipantModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.orderId,_that.userId,_that.user,_that.target);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ParticipantModel implements ParticipantModel {
  const _ParticipantModel({this.id, required this.createdAt, required this.updatedAt, this.deletedAt, this.orderId, this.userId, this.user, required this.target});
  factory _ParticipantModel.fromJson(Map<String, dynamic> json) => _$ParticipantModelFromJson(json);

@override final  int? id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? deletedAt;
@override final  int? orderId;
@override final  String? userId;
@override final  UserModel? user;
@override final  String target;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParticipantModelCopyWith<_ParticipantModel> get copyWith => __$ParticipantModelCopyWithImpl<_ParticipantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParticipantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,deletedAt,orderId,userId,user,target);

@override
String toString() {
  return 'ParticipantModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, orderId: $orderId, userId: $userId, user: $user, target: $target)';
}


}

/// @nodoc
abstract mixin class _$ParticipantModelCopyWith<$Res> implements $ParticipantModelCopyWith<$Res> {
  factory _$ParticipantModelCopyWith(_ParticipantModel value, $Res Function(_ParticipantModel) _then) = __$ParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String createdAt, String updatedAt, String? deletedAt, int? orderId, String? userId, UserModel? user, String target
});


@override $UserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$ParticipantModelCopyWithImpl<$Res>
    implements _$ParticipantModelCopyWith<$Res> {
  __$ParticipantModelCopyWithImpl(this._self, this._then);

  final _ParticipantModel _self;
  final $Res Function(_ParticipantModel) _then;

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? orderId = freezed,Object? userId = freezed,Object? user = freezed,Object? target = null,}) {
  return _then(_ParticipantModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel?,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
