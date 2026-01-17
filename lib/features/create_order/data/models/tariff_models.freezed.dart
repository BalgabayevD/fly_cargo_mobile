// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tariff_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageModel {

 int get id; String get description; String get image; String get name;
/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageModelCopyWith<PackageModel> get copyWith => _$PackageModelCopyWithImpl<PackageModel>(this as PackageModel, _$identity);

  /// Serializes this PackageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,image,name);

@override
String toString() {
  return 'PackageModel(id: $id, description: $description, image: $image, name: $name)';
}


}

/// @nodoc
abstract mixin class $PackageModelCopyWith<$Res>  {
  factory $PackageModelCopyWith(PackageModel value, $Res Function(PackageModel) _then) = _$PackageModelCopyWithImpl;
@useResult
$Res call({
 int id, String description, String image, String name
});




}
/// @nodoc
class _$PackageModelCopyWithImpl<$Res>
    implements $PackageModelCopyWith<$Res> {
  _$PackageModelCopyWithImpl(this._self, this._then);

  final PackageModel _self;
  final $Res Function(PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? image = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageModel].
extension PackageModelPatterns on PackageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageModel value)  $default,){
final _that = this;
switch (_that) {
case _PackageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageModel value)?  $default,){
final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String description,  String image,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.description,_that.image,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String description,  String image,  String name)  $default,) {final _that = this;
switch (_that) {
case _PackageModel():
return $default(_that.id,_that.description,_that.image,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String description,  String image,  String name)?  $default,) {final _that = this;
switch (_that) {
case _PackageModel() when $default != null:
return $default(_that.id,_that.description,_that.image,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageModel implements PackageModel {
  const _PackageModel({required this.id, required this.description, required this.image, required this.name});
  factory _PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

@override final  int id;
@override final  String description;
@override final  String image;
@override final  String name;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageModelCopyWith<_PackageModel> get copyWith => __$PackageModelCopyWithImpl<_PackageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,image,name);

@override
String toString() {
  return 'PackageModel(id: $id, description: $description, image: $image, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PackageModelCopyWith<$Res> implements $PackageModelCopyWith<$Res> {
  factory _$PackageModelCopyWith(_PackageModel value, $Res Function(_PackageModel) _then) = __$PackageModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String description, String image, String name
});




}
/// @nodoc
class __$PackageModelCopyWithImpl<$Res>
    implements _$PackageModelCopyWith<$Res> {
  __$PackageModelCopyWithImpl(this._self, this._then);

  final _PackageModel _self;
  final $Res Function(_PackageModel) _then;

/// Create a copy of PackageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? image = null,Object? name = null,}) {
  return _then(_PackageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TariffModel {

 int get id; String get description; String get image; String get name; List<String>? get fields; double? get height; double? get invoiceWeight; double? get length; double? get volumetricWeight; double? get weight; double? get width;
/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffModelCopyWith<TariffModel> get copyWith => _$TariffModelCopyWithImpl<TariffModel>(this as TariffModel, _$identity);

  /// Serializes this TariffModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.length, length) || other.length == length)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,image,name,const DeepCollectionEquality().hash(fields),height,invoiceWeight,length,volumetricWeight,weight,width);

@override
String toString() {
  return 'TariffModel(id: $id, description: $description, image: $image, name: $name, fields: $fields, height: $height, invoiceWeight: $invoiceWeight, length: $length, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class $TariffModelCopyWith<$Res>  {
  factory $TariffModelCopyWith(TariffModel value, $Res Function(TariffModel) _then) = _$TariffModelCopyWithImpl;
@useResult
$Res call({
 int id, String description, String image, String name, List<String>? fields, double? height, double? invoiceWeight, double? length, double? volumetricWeight, double? weight, double? width
});




}
/// @nodoc
class _$TariffModelCopyWithImpl<$Res>
    implements $TariffModelCopyWith<$Res> {
  _$TariffModelCopyWithImpl(this._self, this._then);

  final TariffModel _self;
  final $Res Function(TariffModel) _then;

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = null,Object? image = null,Object? name = null,Object? fields = freezed,Object? height = freezed,Object? invoiceWeight = freezed,Object? length = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? width = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TariffModel].
extension TariffModelPatterns on TariffModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffModel value)  $default,){
final _that = this;
switch (_that) {
case _TariffModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffModel value)?  $default,){
final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String description,  String image,  String name,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  double? volumetricWeight,  double? weight,  double? width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
return $default(_that.id,_that.description,_that.image,_that.name,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String description,  String image,  String name,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  double? volumetricWeight,  double? weight,  double? width)  $default,) {final _that = this;
switch (_that) {
case _TariffModel():
return $default(_that.id,_that.description,_that.image,_that.name,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String description,  String image,  String name,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  double? volumetricWeight,  double? weight,  double? width)?  $default,) {final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
return $default(_that.id,_that.description,_that.image,_that.name,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.volumetricWeight,_that.weight,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TariffModel implements TariffModel {
  const _TariffModel({required this.id, required this.description, required this.image, required this.name, final  List<String>? fields, this.height, this.invoiceWeight, this.length, this.volumetricWeight, this.weight, this.width}): _fields = fields;
  factory _TariffModel.fromJson(Map<String, dynamic> json) => _$TariffModelFromJson(json);

@override final  int id;
@override final  String description;
@override final  String image;
@override final  String name;
 final  List<String>? _fields;
@override List<String>? get fields {
  final value = _fields;
  if (value == null) return null;
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? height;
@override final  double? invoiceWeight;
@override final  double? length;
@override final  double? volumetricWeight;
@override final  double? weight;
@override final  double? width;

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffModelCopyWith<_TariffModel> get copyWith => __$TariffModelCopyWithImpl<_TariffModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TariffModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.length, length) || other.length == length)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,image,name,const DeepCollectionEquality().hash(_fields),height,invoiceWeight,length,volumetricWeight,weight,width);

@override
String toString() {
  return 'TariffModel(id: $id, description: $description, image: $image, name: $name, fields: $fields, height: $height, invoiceWeight: $invoiceWeight, length: $length, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class _$TariffModelCopyWith<$Res> implements $TariffModelCopyWith<$Res> {
  factory _$TariffModelCopyWith(_TariffModel value, $Res Function(_TariffModel) _then) = __$TariffModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String description, String image, String name, List<String>? fields, double? height, double? invoiceWeight, double? length, double? volumetricWeight, double? weight, double? width
});




}
/// @nodoc
class __$TariffModelCopyWithImpl<$Res>
    implements _$TariffModelCopyWith<$Res> {
  __$TariffModelCopyWithImpl(this._self, this._then);

  final _TariffModel _self;
  final $Res Function(_TariffModel) _then;

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = null,Object? image = null,Object? name = null,Object? fields = freezed,Object? height = freezed,Object? invoiceWeight = freezed,Object? length = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? width = freezed,}) {
  return _then(_TariffModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fields: freezed == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TariffCategoryModel {

 int get id; String get key; String get name; List<TariffModel>? get tariffs;
/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffCategoryModelCopyWith<TariffCategoryModel> get copyWith => _$TariffCategoryModelCopyWithImpl<TariffCategoryModel>(this as TariffCategoryModel, _$identity);

  /// Serializes this TariffCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.tariffs, tariffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,name,const DeepCollectionEquality().hash(tariffs));

@override
String toString() {
  return 'TariffCategoryModel(id: $id, key: $key, name: $name, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class $TariffCategoryModelCopyWith<$Res>  {
  factory $TariffCategoryModelCopyWith(TariffCategoryModel value, $Res Function(TariffCategoryModel) _then) = _$TariffCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String key, String name, List<TariffModel>? tariffs
});




}
/// @nodoc
class _$TariffCategoryModelCopyWithImpl<$Res>
    implements $TariffCategoryModelCopyWith<$Res> {
  _$TariffCategoryModelCopyWithImpl(this._self, this._then);

  final TariffCategoryModel _self;
  final $Res Function(TariffCategoryModel) _then;

/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? name = null,Object? tariffs = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tariffs: freezed == tariffs ? _self.tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TariffCategoryModel].
extension TariffCategoryModelPatterns on TariffCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String key,  String name,  List<TariffModel>? tariffs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that.id,_that.key,_that.name,_that.tariffs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String key,  String name,  List<TariffModel>? tariffs)  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryModel():
return $default(_that.id,_that.key,_that.name,_that.tariffs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String key,  String name,  List<TariffModel>? tariffs)?  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryModel() when $default != null:
return $default(_that.id,_that.key,_that.name,_that.tariffs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TariffCategoryModel implements TariffCategoryModel {
  const _TariffCategoryModel({required this.id, required this.key, required this.name, final  List<TariffModel>? tariffs}): _tariffs = tariffs;
  factory _TariffCategoryModel.fromJson(Map<String, dynamic> json) => _$TariffCategoryModelFromJson(json);

@override final  int id;
@override final  String key;
@override final  String name;
 final  List<TariffModel>? _tariffs;
@override List<TariffModel>? get tariffs {
  final value = _tariffs;
  if (value == null) return null;
  if (_tariffs is EqualUnmodifiableListView) return _tariffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffCategoryModelCopyWith<_TariffCategoryModel> get copyWith => __$TariffCategoryModelCopyWithImpl<_TariffCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TariffCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._tariffs, _tariffs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,name,const DeepCollectionEquality().hash(_tariffs));

@override
String toString() {
  return 'TariffCategoryModel(id: $id, key: $key, name: $name, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class _$TariffCategoryModelCopyWith<$Res> implements $TariffCategoryModelCopyWith<$Res> {
  factory _$TariffCategoryModelCopyWith(_TariffCategoryModel value, $Res Function(_TariffCategoryModel) _then) = __$TariffCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String key, String name, List<TariffModel>? tariffs
});




}
/// @nodoc
class __$TariffCategoryModelCopyWithImpl<$Res>
    implements _$TariffCategoryModelCopyWith<$Res> {
  __$TariffCategoryModelCopyWithImpl(this._self, this._then);

  final _TariffCategoryModel _self;
  final $Res Function(_TariffCategoryModel) _then;

/// Create a copy of TariffCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? name = null,Object? tariffs = freezed,}) {
  return _then(_TariffCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tariffs: freezed == tariffs ? _self._tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffModel>?,
  ));
}


}


/// @nodoc
mixin _$TariffCategoriesApiResponse {

 List<TariffCategoryModel> get data;
/// Create a copy of TariffCategoriesApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffCategoriesApiResponseCopyWith<TariffCategoriesApiResponse> get copyWith => _$TariffCategoriesApiResponseCopyWithImpl<TariffCategoriesApiResponse>(this as TariffCategoriesApiResponse, _$identity);

  /// Serializes this TariffCategoriesApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffCategoriesApiResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TariffCategoriesApiResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $TariffCategoriesApiResponseCopyWith<$Res>  {
  factory $TariffCategoriesApiResponseCopyWith(TariffCategoriesApiResponse value, $Res Function(TariffCategoriesApiResponse) _then) = _$TariffCategoriesApiResponseCopyWithImpl;
@useResult
$Res call({
 List<TariffCategoryModel> data
});




}
/// @nodoc
class _$TariffCategoriesApiResponseCopyWithImpl<$Res>
    implements $TariffCategoriesApiResponseCopyWith<$Res> {
  _$TariffCategoriesApiResponseCopyWithImpl(this._self, this._then);

  final TariffCategoriesApiResponse _self;
  final $Res Function(TariffCategoriesApiResponse) _then;

/// Create a copy of TariffCategoriesApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TariffCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TariffCategoriesApiResponse].
extension TariffCategoriesApiResponsePatterns on TariffCategoriesApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffCategoriesApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffCategoriesApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffCategoriesApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TariffCategoryModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TariffCategoryModel> data)  $default,) {final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TariffCategoryModel> data)?  $default,) {final _that = this;
switch (_that) {
case _TariffCategoriesApiResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TariffCategoriesApiResponse implements TariffCategoriesApiResponse {
  const _TariffCategoriesApiResponse({required final  List<TariffCategoryModel> data}): _data = data;
  factory _TariffCategoriesApiResponse.fromJson(Map<String, dynamic> json) => _$TariffCategoriesApiResponseFromJson(json);

 final  List<TariffCategoryModel> _data;
@override List<TariffCategoryModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of TariffCategoriesApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffCategoriesApiResponseCopyWith<_TariffCategoriesApiResponse> get copyWith => __$TariffCategoriesApiResponseCopyWithImpl<_TariffCategoriesApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TariffCategoriesApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffCategoriesApiResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'TariffCategoriesApiResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$TariffCategoriesApiResponseCopyWith<$Res> implements $TariffCategoriesApiResponseCopyWith<$Res> {
  factory _$TariffCategoriesApiResponseCopyWith(_TariffCategoriesApiResponse value, $Res Function(_TariffCategoriesApiResponse) _then) = __$TariffCategoriesApiResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TariffCategoryModel> data
});




}
/// @nodoc
class __$TariffCategoriesApiResponseCopyWithImpl<$Res>
    implements _$TariffCategoriesApiResponseCopyWith<$Res> {
  __$TariffCategoriesApiResponseCopyWithImpl(this._self, this._then);

  final _TariffCategoriesApiResponse _self;
  final $Res Function(_TariffCategoriesApiResponse) _then;

/// Create a copy of TariffCategoriesApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_TariffCategoriesApiResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TariffCategoryModel>,
  ));
}


}


/// @nodoc
mixin _$CreateTariffRequest {

 double get additionalCostForFragileCargo; double get costPriceOfAirShipment; String get description; List<String> get fields; double get height; int get icon; String get image; bool get isActive; double get length; String get name; int get packageId; int get sortIndex; int get tariffCategoryId; double get volumetricWeight; double get weight; double get width;
/// Create a copy of CreateTariffRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTariffRequestCopyWith<CreateTariffRequest> get copyWith => _$CreateTariffRequestCopyWithImpl<CreateTariffRequest>(this as CreateTariffRequest, _$identity);

  /// Serializes this CreateTariffRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTariffRequest&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.length, length) || other.length == length)&&(identical(other.name, name) || other.name == name)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,additionalCostForFragileCargo,costPriceOfAirShipment,description,const DeepCollectionEquality().hash(fields),height,icon,image,isActive,length,name,packageId,sortIndex,tariffCategoryId,volumetricWeight,weight,width);

@override
String toString() {
  return 'CreateTariffRequest(additionalCostForFragileCargo: $additionalCostForFragileCargo, costPriceOfAirShipment: $costPriceOfAirShipment, description: $description, fields: $fields, height: $height, icon: $icon, image: $image, isActive: $isActive, length: $length, name: $name, packageId: $packageId, sortIndex: $sortIndex, tariffCategoryId: $tariffCategoryId, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class $CreateTariffRequestCopyWith<$Res>  {
  factory $CreateTariffRequestCopyWith(CreateTariffRequest value, $Res Function(CreateTariffRequest) _then) = _$CreateTariffRequestCopyWithImpl;
@useResult
$Res call({
 double additionalCostForFragileCargo, double costPriceOfAirShipment, String description, List<String> fields, double height, int icon, String image, bool isActive, double length, String name, int packageId, int sortIndex, int tariffCategoryId, double volumetricWeight, double weight, double width
});




}
/// @nodoc
class _$CreateTariffRequestCopyWithImpl<$Res>
    implements $CreateTariffRequestCopyWith<$Res> {
  _$CreateTariffRequestCopyWithImpl(this._self, this._then);

  final CreateTariffRequest _self;
  final $Res Function(CreateTariffRequest) _then;

/// Create a copy of CreateTariffRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? additionalCostForFragileCargo = null,Object? costPriceOfAirShipment = null,Object? description = null,Object? fields = null,Object? height = null,Object? icon = null,Object? image = null,Object? isActive = null,Object? length = null,Object? name = null,Object? packageId = null,Object? sortIndex = null,Object? tariffCategoryId = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,}) {
  return _then(_self.copyWith(
additionalCostForFragileCargo: null == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double,costPriceOfAirShipment: null == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,sortIndex: null == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int,tariffCategoryId: null == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTariffRequest].
extension CreateTariffRequestPatterns on CreateTariffRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTariffRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTariffRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTariffRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateTariffRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTariffRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTariffRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double additionalCostForFragileCargo,  double costPriceOfAirShipment,  String description,  List<String> fields,  double height,  int icon,  String image,  bool isActive,  double length,  String name,  int packageId,  int sortIndex,  int tariffCategoryId,  double volumetricWeight,  double weight,  double width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTariffRequest() when $default != null:
return $default(_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.description,_that.fields,_that.height,_that.icon,_that.image,_that.isActive,_that.length,_that.name,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double additionalCostForFragileCargo,  double costPriceOfAirShipment,  String description,  List<String> fields,  double height,  int icon,  String image,  bool isActive,  double length,  String name,  int packageId,  int sortIndex,  int tariffCategoryId,  double volumetricWeight,  double weight,  double width)  $default,) {final _that = this;
switch (_that) {
case _CreateTariffRequest():
return $default(_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.description,_that.fields,_that.height,_that.icon,_that.image,_that.isActive,_that.length,_that.name,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double additionalCostForFragileCargo,  double costPriceOfAirShipment,  String description,  List<String> fields,  double height,  int icon,  String image,  bool isActive,  double length,  String name,  int packageId,  int sortIndex,  int tariffCategoryId,  double volumetricWeight,  double weight,  double width)?  $default,) {final _that = this;
switch (_that) {
case _CreateTariffRequest() when $default != null:
return $default(_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.description,_that.fields,_that.height,_that.icon,_that.image,_that.isActive,_that.length,_that.name,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTariffRequest implements CreateTariffRequest {
  const _CreateTariffRequest({required this.additionalCostForFragileCargo, required this.costPriceOfAirShipment, required this.description, required final  List<String> fields, required this.height, required this.icon, required this.image, required this.isActive, required this.length, required this.name, required this.packageId, required this.sortIndex, required this.tariffCategoryId, required this.volumetricWeight, required this.weight, required this.width}): _fields = fields;
  factory _CreateTariffRequest.fromJson(Map<String, dynamic> json) => _$CreateTariffRequestFromJson(json);

@override final  double additionalCostForFragileCargo;
@override final  double costPriceOfAirShipment;
@override final  String description;
 final  List<String> _fields;
@override List<String> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

@override final  double height;
@override final  int icon;
@override final  String image;
@override final  bool isActive;
@override final  double length;
@override final  String name;
@override final  int packageId;
@override final  int sortIndex;
@override final  int tariffCategoryId;
@override final  double volumetricWeight;
@override final  double weight;
@override final  double width;

/// Create a copy of CreateTariffRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTariffRequestCopyWith<_CreateTariffRequest> get copyWith => __$CreateTariffRequestCopyWithImpl<_CreateTariffRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTariffRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTariffRequest&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.length, length) || other.length == length)&&(identical(other.name, name) || other.name == name)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,additionalCostForFragileCargo,costPriceOfAirShipment,description,const DeepCollectionEquality().hash(_fields),height,icon,image,isActive,length,name,packageId,sortIndex,tariffCategoryId,volumetricWeight,weight,width);

@override
String toString() {
  return 'CreateTariffRequest(additionalCostForFragileCargo: $additionalCostForFragileCargo, costPriceOfAirShipment: $costPriceOfAirShipment, description: $description, fields: $fields, height: $height, icon: $icon, image: $image, isActive: $isActive, length: $length, name: $name, packageId: $packageId, sortIndex: $sortIndex, tariffCategoryId: $tariffCategoryId, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class _$CreateTariffRequestCopyWith<$Res> implements $CreateTariffRequestCopyWith<$Res> {
  factory _$CreateTariffRequestCopyWith(_CreateTariffRequest value, $Res Function(_CreateTariffRequest) _then) = __$CreateTariffRequestCopyWithImpl;
@override @useResult
$Res call({
 double additionalCostForFragileCargo, double costPriceOfAirShipment, String description, List<String> fields, double height, int icon, String image, bool isActive, double length, String name, int packageId, int sortIndex, int tariffCategoryId, double volumetricWeight, double weight, double width
});




}
/// @nodoc
class __$CreateTariffRequestCopyWithImpl<$Res>
    implements _$CreateTariffRequestCopyWith<$Res> {
  __$CreateTariffRequestCopyWithImpl(this._self, this._then);

  final _CreateTariffRequest _self;
  final $Res Function(_CreateTariffRequest) _then;

/// Create a copy of CreateTariffRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? additionalCostForFragileCargo = null,Object? costPriceOfAirShipment = null,Object? description = null,Object? fields = null,Object? height = null,Object? icon = null,Object? image = null,Object? isActive = null,Object? length = null,Object? name = null,Object? packageId = null,Object? sortIndex = null,Object? tariffCategoryId = null,Object? volumetricWeight = null,Object? weight = null,Object? width = null,}) {
  return _then(_CreateTariffRequest(
additionalCostForFragileCargo: null == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double,costPriceOfAirShipment: null == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int,sortIndex: null == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int,tariffCategoryId: null == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int,volumetricWeight: null == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
