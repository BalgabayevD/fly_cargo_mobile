// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSessionInfoModel {

 UserSessionModel get session; UserModel get user; String? get accessToken;
/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionInfoModelCopyWith<UserSessionInfoModel> get copyWith => _$UserSessionInfoModelCopyWithImpl<UserSessionInfoModel>(this as UserSessionInfoModel, _$identity);

  /// Serializes this UserSessionInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSessionInfoModel&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user,accessToken);

@override
String toString() {
  return 'UserSessionInfoModel(session: $session, user: $user, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class $UserSessionInfoModelCopyWith<$Res>  {
  factory $UserSessionInfoModelCopyWith(UserSessionInfoModel value, $Res Function(UserSessionInfoModel) _then) = _$UserSessionInfoModelCopyWithImpl;
@useResult
$Res call({
 UserSessionModel session, UserModel user, String? accessToken
});


$UserSessionModelCopyWith<$Res> get session;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$UserSessionInfoModelCopyWithImpl<$Res>
    implements $UserSessionInfoModelCopyWith<$Res> {
  _$UserSessionInfoModelCopyWithImpl(this._self, this._then);

  final UserSessionInfoModel _self;
  final $Res Function(UserSessionInfoModel) _then;

/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? user = null,Object? accessToken = freezed,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as UserSessionModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSessionModelCopyWith<$Res> get session {
  
  return $UserSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSessionInfoModel].
extension UserSessionInfoModelPatterns on UserSessionInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSessionInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSessionInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSessionInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _UserSessionInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSessionInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserSessionInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserSessionModel session,  UserModel user,  String? accessToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSessionInfoModel() when $default != null:
return $default(_that.session,_that.user,_that.accessToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserSessionModel session,  UserModel user,  String? accessToken)  $default,) {final _that = this;
switch (_that) {
case _UserSessionInfoModel():
return $default(_that.session,_that.user,_that.accessToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserSessionModel session,  UserModel user,  String? accessToken)?  $default,) {final _that = this;
switch (_that) {
case _UserSessionInfoModel() when $default != null:
return $default(_that.session,_that.user,_that.accessToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSessionInfoModel implements UserSessionInfoModel {
  const _UserSessionInfoModel({required this.session, required this.user, required this.accessToken});
  factory _UserSessionInfoModel.fromJson(Map<String, dynamic> json) => _$UserSessionInfoModelFromJson(json);

@override final  UserSessionModel session;
@override final  UserModel user;
@override final  String? accessToken;

/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionInfoModelCopyWith<_UserSessionInfoModel> get copyWith => __$UserSessionInfoModelCopyWithImpl<_UserSessionInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSessionInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSessionInfoModel&&(identical(other.session, session) || other.session == session)&&(identical(other.user, user) || other.user == user)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,user,accessToken);

@override
String toString() {
  return 'UserSessionInfoModel(session: $session, user: $user, accessToken: $accessToken)';
}


}

/// @nodoc
abstract mixin class _$UserSessionInfoModelCopyWith<$Res> implements $UserSessionInfoModelCopyWith<$Res> {
  factory _$UserSessionInfoModelCopyWith(_UserSessionInfoModel value, $Res Function(_UserSessionInfoModel) _then) = __$UserSessionInfoModelCopyWithImpl;
@override @useResult
$Res call({
 UserSessionModel session, UserModel user, String? accessToken
});


@override $UserSessionModelCopyWith<$Res> get session;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$UserSessionInfoModelCopyWithImpl<$Res>
    implements _$UserSessionInfoModelCopyWith<$Res> {
  __$UserSessionInfoModelCopyWithImpl(this._self, this._then);

  final _UserSessionInfoModel _self;
  final $Res Function(_UserSessionInfoModel) _then;

/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? user = null,Object? accessToken = freezed,}) {
  return _then(_UserSessionInfoModel(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as UserSessionModel,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSessionModelCopyWith<$Res> get session {
  
  return $UserSessionModelCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}/// Create a copy of UserSessionInfoModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$UserSessionModel {

 String get id; String get createdAt; String get updatedAt; String get expiresAt; String get token; String get ipAddress; String get userId;
/// Create a copy of UserSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionModelCopyWith<UserSessionModel> get copyWith => _$UserSessionModelCopyWithImpl<UserSessionModel>(this as UserSessionModel, _$identity);

  /// Serializes this UserSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.token, token) || other.token == token)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,expiresAt,token,ipAddress,userId);

@override
String toString() {
  return 'UserSessionModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, token: $token, ipAddress: $ipAddress, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserSessionModelCopyWith<$Res>  {
  factory $UserSessionModelCopyWith(UserSessionModel value, $Res Function(UserSessionModel) _then) = _$UserSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String createdAt, String updatedAt, String expiresAt, String token, String ipAddress, String userId
});




}
/// @nodoc
class _$UserSessionModelCopyWithImpl<$Res>
    implements $UserSessionModelCopyWith<$Res> {
  _$UserSessionModelCopyWithImpl(this._self, this._then);

  final UserSessionModel _self;
  final $Res Function(UserSessionModel) _then;

/// Create a copy of UserSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? expiresAt = null,Object? token = null,Object? ipAddress = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSessionModel].
extension UserSessionModelPatterns on UserSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _UserSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String createdAt,  String updatedAt,  String expiresAt,  String token,  String ipAddress,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSessionModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.token,_that.ipAddress,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String createdAt,  String updatedAt,  String expiresAt,  String token,  String ipAddress,  String userId)  $default,) {final _that = this;
switch (_that) {
case _UserSessionModel():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.token,_that.ipAddress,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String createdAt,  String updatedAt,  String expiresAt,  String token,  String ipAddress,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _UserSessionModel() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.token,_that.ipAddress,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSessionModel implements UserSessionModel {
  const _UserSessionModel({required this.id, required this.createdAt, required this.updatedAt, required this.expiresAt, required this.token, required this.ipAddress, required this.userId});
  factory _UserSessionModel.fromJson(Map<String, dynamic> json) => _$UserSessionModelFromJson(json);

@override final  String id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String expiresAt;
@override final  String token;
@override final  String ipAddress;
@override final  String userId;

/// Create a copy of UserSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionModelCopyWith<_UserSessionModel> get copyWith => __$UserSessionModelCopyWithImpl<_UserSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.token, token) || other.token == token)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,expiresAt,token,ipAddress,userId);

@override
String toString() {
  return 'UserSessionModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, token: $token, ipAddress: $ipAddress, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$UserSessionModelCopyWith<$Res> implements $UserSessionModelCopyWith<$Res> {
  factory _$UserSessionModelCopyWith(_UserSessionModel value, $Res Function(_UserSessionModel) _then) = __$UserSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String createdAt, String updatedAt, String expiresAt, String token, String ipAddress, String userId
});




}
/// @nodoc
class __$UserSessionModelCopyWithImpl<$Res>
    implements _$UserSessionModelCopyWith<$Res> {
  __$UserSessionModelCopyWithImpl(this._self, this._then);

  final _UserSessionModel _self;
  final $Res Function(_UserSessionModel) _then;

/// Create a copy of UserSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? expiresAt = null,Object? token = null,Object? ipAddress = null,Object? userId = null,}) {
  return _then(_UserSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UserModel {

 String get id; String? get name; String? get email; bool get emailVerified; String? get image; String get createdAt; String get updatedAt; String? get phoneNumber; bool get phoneNumberVerified; UserRole get role; bool get banned; String? get banReason; String? get banExpires; String? get lang; String? get firstName; String? get lastName; String? get middleName; String? get birthDay; String? get city; String? get type; String? get iin; String? get bin;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.role, role) || other.role == role)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.banExpires, banExpires) || other.banExpires == banExpires)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.city, city) || other.city == city)&&(identical(other.type, type) || other.type == type)&&(identical(other.iin, iin) || other.iin == iin)&&(identical(other.bin, bin) || other.bin == bin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,emailVerified,image,createdAt,updatedAt,phoneNumber,phoneNumberVerified,role,banned,banReason,banExpires,lang,firstName,lastName,middleName,birthDay,city,type,iin,bin]);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, emailVerified: $emailVerified, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, role: $role, banned: $banned, banReason: $banReason, banExpires: $banExpires, lang: $lang, firstName: $firstName, lastName: $lastName, middleName: $middleName, birthDay: $birthDay, city: $city, type: $type, iin: $iin, bin: $bin)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? email, bool emailVerified, String? image, String createdAt, String updatedAt, String? phoneNumber, bool phoneNumberVerified, UserRole role, bool banned, String? banReason, String? banExpires, String? lang, String? firstName, String? lastName, String? middleName, String? birthDay, String? city, String? type, String? iin, String? bin
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? emailVerified = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? phoneNumber = freezed,Object? phoneNumberVerified = null,Object? role = null,Object? banned = null,Object? banReason = freezed,Object? banExpires = freezed,Object? lang = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? birthDay = freezed,Object? city = freezed,Object? type = freezed,Object? iin = freezed,Object? bin = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,banExpires: freezed == banExpires ? _self.banExpires : banExpires // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,birthDay: freezed == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,iin: freezed == iin ? _self.iin : iin // ignore: cast_nullable_to_non_nullable
as String?,bin: freezed == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? email,  bool emailVerified,  String? image,  String createdAt,  String updatedAt,  String? phoneNumber,  bool phoneNumberVerified,  UserRole role,  bool banned,  String? banReason,  String? banExpires,  String? lang,  String? firstName,  String? lastName,  String? middleName,  String? birthDay,  String? city,  String? type,  String? iin,  String? bin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.image,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.banReason,_that.banExpires,_that.lang,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.city,_that.type,_that.iin,_that.bin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? email,  bool emailVerified,  String? image,  String createdAt,  String updatedAt,  String? phoneNumber,  bool phoneNumberVerified,  UserRole role,  bool banned,  String? banReason,  String? banExpires,  String? lang,  String? firstName,  String? lastName,  String? middleName,  String? birthDay,  String? city,  String? type,  String? iin,  String? bin)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.image,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.banReason,_that.banExpires,_that.lang,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.city,_that.type,_that.iin,_that.bin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? email,  bool emailVerified,  String? image,  String createdAt,  String updatedAt,  String? phoneNumber,  bool phoneNumberVerified,  UserRole role,  bool banned,  String? banReason,  String? banExpires,  String? lang,  String? firstName,  String? lastName,  String? middleName,  String? birthDay,  String? city,  String? type,  String? iin,  String? bin)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.emailVerified,_that.image,_that.createdAt,_that.updatedAt,_that.phoneNumber,_that.phoneNumberVerified,_that.role,_that.banned,_that.banReason,_that.banExpires,_that.lang,_that.firstName,_that.lastName,_that.middleName,_that.birthDay,_that.city,_that.type,_that.iin,_that.bin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({required this.id, required this.name, required this.email, required this.emailVerified, required this.image, required this.createdAt, required this.updatedAt, required this.phoneNumber, required this.phoneNumberVerified, required this.role, required this.banned, required this.banReason, required this.banExpires, required this.lang, required this.firstName, required this.lastName, required this.middleName, required this.birthDay, required this.city, required this.type, required this.iin, required this.bin});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? email;
@override final  bool emailVerified;
@override final  String? image;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String? phoneNumber;
@override final  bool phoneNumberVerified;
@override final  UserRole role;
@override final  bool banned;
@override final  String? banReason;
@override final  String? banExpires;
@override final  String? lang;
@override final  String? firstName;
@override final  String? lastName;
@override final  String? middleName;
@override final  String? birthDay;
@override final  String? city;
@override final  String? type;
@override final  String? iin;
@override final  String? bin;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.image, image) || other.image == image)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.role, role) || other.role == role)&&(identical(other.banned, banned) || other.banned == banned)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.banExpires, banExpires) || other.banExpires == banExpires)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.middleName, middleName) || other.middleName == middleName)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.city, city) || other.city == city)&&(identical(other.type, type) || other.type == type)&&(identical(other.iin, iin) || other.iin == iin)&&(identical(other.bin, bin) || other.bin == bin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,email,emailVerified,image,createdAt,updatedAt,phoneNumber,phoneNumberVerified,role,banned,banReason,banExpires,lang,firstName,lastName,middleName,birthDay,city,type,iin,bin]);

@override
String toString() {
  return 'UserModel(id: $id, name: $name, email: $email, emailVerified: $emailVerified, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, phoneNumberVerified: $phoneNumberVerified, role: $role, banned: $banned, banReason: $banReason, banExpires: $banExpires, lang: $lang, firstName: $firstName, lastName: $lastName, middleName: $middleName, birthDay: $birthDay, city: $city, type: $type, iin: $iin, bin: $bin)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? email, bool emailVerified, String? image, String createdAt, String updatedAt, String? phoneNumber, bool phoneNumberVerified, UserRole role, bool banned, String? banReason, String? banExpires, String? lang, String? firstName, String? lastName, String? middleName, String? birthDay, String? city, String? type, String? iin, String? bin
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? email = freezed,Object? emailVerified = null,Object? image = freezed,Object? createdAt = null,Object? updatedAt = null,Object? phoneNumber = freezed,Object? phoneNumberVerified = null,Object? role = null,Object? banned = null,Object? banReason = freezed,Object? banExpires = freezed,Object? lang = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? middleName = freezed,Object? birthDay = freezed,Object? city = freezed,Object? type = freezed,Object? iin = freezed,Object? bin = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,banned: null == banned ? _self.banned : banned // ignore: cast_nullable_to_non_nullable
as bool,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,banExpires: freezed == banExpires ? _self.banExpires : banExpires // ignore: cast_nullable_to_non_nullable
as String?,lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,middleName: freezed == middleName ? _self.middleName : middleName // ignore: cast_nullable_to_non_nullable
as String?,birthDay: freezed == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,iin: freezed == iin ? _self.iin : iin // ignore: cast_nullable_to_non_nullable
as String?,bin: freezed == bin ? _self.bin : bin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
