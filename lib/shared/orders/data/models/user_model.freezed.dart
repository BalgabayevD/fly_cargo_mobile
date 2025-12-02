// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get createdAt; String get updatedAt; String get uuid; String get email; String get phone; String get firstName; String get lastName; String get middleName; String get birthDay; String get photo; String get city; String get type; String get iin; String get bin; String get role; int? get id; String? get deletedAt; dynamic get access;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.city, city) || other.city == city)&&(identical(other.type, type) || other.type == type)&&(identical(other.iin, iin) || other.iin == iin)&&(identical(other.bin, bin) || other.bin == bin)&&(identical(other.role, role) || other.role == role)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.access, access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,uuid,email,phone,firstName,lastName,middleName,birthDay,photo,city,type,iin,bin,role,id,deletedAt,const DeepCollectionEquality().hash(access));

@override
String toString() {
  return 'UserModel(createdAt: $createdAt, updatedAt: $updatedAt, uuid: $uuid, email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, middleName: $middleName, birthDay: $birthDay, photo: $photo, city: $city, type: $type, iin: $iin, bin: $bin, role: $role, id: $id, deletedAt: $deletedAt, access: $access)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String createdAt, String updatedAt, String uuid, String email, String phone, String firstName, String lastName, String middleName, String birthDay, String photo, String city, String type, String iin, String bin, String role, int? id, String? deletedAt, dynamic access
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? updatedAt = null,Object? uuid = null,Object? email = null,Object? phone = null,Object? firstName = null,Object? lastName = null,Object? middleName = null,Object? birthDay = null,Object? photo = null,Object? city = null,Object? type = null,Object? iin = null,Object? bin = null,Object? role = null,Object? id = freezed,Object? deletedAt = freezed,Object? access = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,birthDay: null == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,iin: null == iin ? _self.iin : iin // ignore: cast_nullable_to_non_nullable
as String,bin: null == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  String uuid,  String email,  String phone,  String firstName,  String lastName,  String middleName,  String birthDay,  String photo,  String city,  String type,  String iin,  String bin,  String role,  int? id,  String? deletedAt,  dynamic access)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.uuid,_that.email,_that.phone,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.photo,_that.city,_that.type,_that.iin,_that.bin,_that.role,_that.id,_that.deletedAt,_that.access);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  String uuid,  String email,  String phone,  String firstName,  String lastName,  String middleName,  String birthDay,  String photo,  String city,  String type,  String iin,  String bin,  String role,  int? id,  String? deletedAt,  dynamic access)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.createdAt,_that.updatedAt,_that.uuid,_that.email,_that.phone,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.photo,_that.city,_that.type,_that.iin,_that.bin,_that.role,_that.id,_that.deletedAt,_that.access);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String updatedAt,  String uuid,  String email,  String phone,  String firstName,  String lastName,  String middleName,  String birthDay,  String photo,  String city,  String type,  String iin,  String bin,  String role,  int? id,  String? deletedAt,  dynamic access)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.uuid,_that.email,_that.phone,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.photo,_that.city,_that.type,_that.iin,_that.bin,_that.role,_that.id,_that.deletedAt,_that.access);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.createdAt, required this.updatedAt, required this.uuid, required this.email, required this.phone, required this.firstName, required this.lastName, required this.middleName, required this.birthDay, required this.photo, required this.city, required this.type, required this.iin, required this.bin, required this.role, this.id, this.deletedAt, this.access});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String createdAt;
@override final  String updatedAt;
@override final  String uuid;
@override final  String email;
@override final  String phone;
@override final  String firstName;
@override final  String lastName;
@override final  String middleName;
@override final  String birthDay;
@override final  String photo;
@override final  String city;
@override final  String type;
@override final  String iin;
@override final  String bin;
@override final  String role;
@override final  int? id;
@override final  String? deletedAt;
@override final  dynamic access;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.city, city) || other.city == city)&&(identical(other.type, type) || other.type == type)&&(identical(other.iin, iin) || other.iin == iin)&&(identical(other.bin, bin) || other.bin == bin)&&(identical(other.role, role) || other.role == role)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.access, access));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,uuid,email,phone,firstName,lastName,middleName,birthDay,photo,city,type,iin,bin,role,id,deletedAt,const DeepCollectionEquality().hash(access));

@override
String toString() {
  return 'UserModel(createdAt: $createdAt, updatedAt: $updatedAt, uuid: $uuid, email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, middleName: $middleName, birthDay: $birthDay, photo: $photo, city: $city, type: $type, iin: $iin, bin: $bin, role: $role, id: $id, deletedAt: $deletedAt, access: $access)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String updatedAt, String uuid, String email, String phone, String firstName, String lastName, String middleName, String birthDay, String photo, String city, String type, String iin, String bin, String role, int? id, String? deletedAt, dynamic access
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? updatedAt = null,Object? uuid = null,Object? email = null,Object? phone = null,Object? firstName = null,Object? lastName = null,Object? middleName = null,Object? birthDay = null,Object? photo = null,Object? city = null,Object? type = null,Object? iin = null,Object? bin = null,Object? role = null,Object? id = freezed,Object? deletedAt = freezed,Object? access = freezed,}) {
  return _then(_UserModel(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,middleName: null == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String,birthDay: null == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,iin: null == iin ? _self.iin : iin // ignore: cast_nullable_to_non_nullable
as String,bin: null == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,access: freezed == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
