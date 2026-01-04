// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileEntity {

 String get id; String get name; String get email; bool get emailVerified; String get createdAt; String get updatedAt; String get phoneNumber; bool get phoneNumberVerified; UserType get role; bool get banned; String? get image; String? get banReason; String? get banExpires; String? get lang;
/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<UserProfileEntity> get copyWith => _$UserProfileEntityCopyWithImpl<UserProfileEntity>(this as UserProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.role, role) || other.role == role)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.image, image) || other.image == image)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.banExpires, banExpires) || other.banExpires == banExpires)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,emailVerified,createdAt,updatedAt,phoneNumber,phoneNumberVerified,role,banned,image,banReason,banExpires,lang);

@override
String toString() {
  return 'UserProfileEntity(id: $id, name: $name, email: $email, emailVerified: $emailVerified, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, role: $role, banned: $banned, image: $image, banReason: $banReason, banExpires: $banExpires, lang: $lang)';
}


}

/// @nodoc
abstract mixin class $UserProfileEntityCopyWith<$Res>  {
  factory $UserProfileEntityCopyWith(UserProfileEntity value, $Res Function(UserProfileEntity) _then) = _$UserProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String email, bool emailVerified, String createdAt, String updatedAt, String phoneNumber, bool phoneNumberVerified, UserType role, bool banned, String? image, String? banReason, String? banExpires, String? lang
});




}
/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._self, this._then);

  final UserProfileEntity _self;
  final $Res Function(UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = null,Object? emailVerified = null,Object? createdAt = null,Object? updatedAt = null,Object? phoneNumber = null,Object? phoneNumberVerified = null,Object? role = null,Object? banned = null,Object? image = freezed,Object? banReason = freezed,Object? banExpires = freezed,Object? lang = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserType,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,banExpires: freezed == banExpires ? _self.banExpires : banExpires // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileEntity].
extension UserProfileEntityPatterns on UserProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String email,  bool emailVerified,  String createdAt,  String updatedAt,  String phoneNumber,  bool phoneNumberVerified,  UserType role,  bool banned,  String? image,  String? banReason,  String? banExpires,  String? lang)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.image,_that.banReason,_that.banExpires,_that.lang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String email,  bool emailVerified,  String createdAt,  String updatedAt,  String phoneNumber,  bool phoneNumberVerified,  UserType role,  bool banned,  String? image,  String? banReason,  String? banExpires,  String? lang)  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity():
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.image,_that.banReason,_that.banExpires,_that.lang);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String email,  bool emailVerified,  String createdAt,  String updatedAt,  String phoneNumber,  bool phoneNumberVerified,  UserType role,  bool banned,  String? image,  String? banReason,  String? banExpires,  String? lang)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.image,_that.banReason,_that.banExpires,_that.lang);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileEntity implements UserProfileEntity {
  const _UserProfileEntity({required this.id, required this.name, required this.email, required this.emailVerified, required this.createdAt, required this.updatedAt, required this.phoneNumber, required this.phoneNumberVerified, required this.role, required this.banned, this.image, this.banReason, this.banExpires, this.lang});
  

@override final  String id;
@override final  String name;
@override final  String email;
@override final  bool emailVerified;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String phoneNumber;
@override final  bool phoneNumberVerified;
@override final  UserType role;
@override final  bool banned;
@override final  String? image;
@override final  String? banReason;
@override final  String? banExpires;
@override final  String? lang;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileEntityCopyWith<_UserProfileEntity> get copyWith => __$UserProfileEntityCopyWithImpl<_UserProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.role, role) || other.role == role)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.image, image) || other.image == image)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.banExpires, banExpires) || other.banExpires == banExpires)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,email,emailVerified,createdAt,updatedAt,phoneNumber,phoneNumberVerified,role,banned,image,banReason,banExpires,lang);

@override
String toString() {
  return 'UserProfileEntity(id: $id, name: $name, email: $email, emailVerified: $emailVerified, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, role: $role, banned: $banned, image: $image, banReason: $banReason, banExpires: $banExpires, lang: $lang)';
}


}

/// @nodoc
abstract mixin class _$UserProfileEntityCopyWith<$Res> implements $UserProfileEntityCopyWith<$Res> {
  factory _$UserProfileEntityCopyWith(_UserProfileEntity value, $Res Function(_UserProfileEntity) _then) = __$UserProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String email, bool emailVerified, String createdAt, String updatedAt, String phoneNumber, bool phoneNumberVerified, UserType role, bool banned, String? image, String? banReason, String? banExpires, String? lang
});




}
/// @nodoc
class __$UserProfileEntityCopyWithImpl<$Res>
    implements _$UserProfileEntityCopyWith<$Res> {
  __$UserProfileEntityCopyWithImpl(this._self, this._then);

  final _UserProfileEntity _self;
  final $Res Function(_UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = null,Object? emailVerified = null,Object? createdAt = null,Object? updatedAt = null,Object? phoneNumber = null,Object? phoneNumberVerified = null,Object? role = null,Object? banned = null,Object? image = freezed,Object? banReason = freezed,Object? banExpires = freezed,Object? lang = freezed,}) {
  return _then(_UserProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserType,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,banExpires: freezed == banExpires ? _self.banExpires : banExpires // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
