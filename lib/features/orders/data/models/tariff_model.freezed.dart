// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tariff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TariffModel {

 String get createdAt; String get updatedAt; bool get isActive; String get name; String get description; String get image; int? get id; String? get deletedAt; int? get icon; int? get sortIndex; List<String>? get fields; int? get tariffCategoryId; double? get length; double? get height; double? get width; double? get volumetricWeight; double? get weight; double? get invoiceWeight; double? get costPriceOfAirShipment; int? get packageId; double? get additionalCostForFragileCargo; TariffCategoryModel? get tariffCategory; PackageModel? get package;
/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffModelCopyWith<TariffModel> get copyWith => _$TariffModelCopyWithImpl<TariffModel>(this as TariffModel, _$identity);

  /// Serializes this TariffModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.tariffCategory, tariffCategory) || other.tariffCategory == tariffCategory)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,isActive,name,description,image,id,deletedAt,icon,sortIndex,const DeepCollectionEquality().hash(fields),tariffCategoryId,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,packageId,additionalCostForFragileCargo,tariffCategory,package]);

@override
String toString() {
  return 'TariffModel(createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, name: $name, description: $description, image: $image, id: $id, deletedAt: $deletedAt, icon: $icon, sortIndex: $sortIndex, fields: $fields, tariffCategoryId: $tariffCategoryId, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, packageId: $packageId, additionalCostForFragileCargo: $additionalCostForFragileCargo, tariffCategory: $tariffCategory, package: $package)';
}


}

/// @nodoc
abstract mixin class $TariffModelCopyWith<$Res>  {
  factory $TariffModelCopyWith(TariffModel value, $Res Function(TariffModel) _then) = _$TariffModelCopyWithImpl;
@useResult
$Res call({
 String createdAt, String updatedAt, bool isActive, String name, String description, String image, int? id, String? deletedAt, int? icon, int? sortIndex, List<String>? fields, int? tariffCategoryId, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, int? packageId, double? additionalCostForFragileCargo, TariffCategoryModel? tariffCategory, PackageModel? package
});


$TariffCategoryModelCopyWith<$Res>? get tariffCategory;$PackageModelCopyWith<$Res>? get package;

}
/// @nodoc
class _$TariffModelCopyWithImpl<$Res>
    implements $TariffModelCopyWith<$Res> {
  _$TariffModelCopyWithImpl(this._self, this._then);

  final TariffModel _self;
  final $Res Function(TariffModel) _then;

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? name = null,Object? description = null,Object? image = null,Object? id = freezed,Object? deletedAt = freezed,Object? icon = freezed,Object? sortIndex = freezed,Object? fields = freezed,Object? tariffCategoryId = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? packageId = freezed,Object? additionalCostForFragileCargo = freezed,Object? tariffCategory = freezed,Object? package = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,tariffCategory: freezed == tariffCategory ? _self.tariffCategory : tariffCategory // ignore: cast_nullable_to_non_nullable
as TariffCategoryModel?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,
  ));
}
/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TariffCategoryModelCopyWith<$Res>? get tariffCategory {
    if (_self.tariffCategory == null) {
    return null;
  }

  return $TariffCategoryModelCopyWith<$Res>(_self.tariffCategory!, (value) {
    return _then(_self.copyWith(tariffCategory: value));
  });
}/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo,  TariffCategoryModel? tariffCategory,  PackageModel? package)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo,_that.tariffCategory,_that.package);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo,  TariffCategoryModel? tariffCategory,  PackageModel? package)  $default,) {final _that = this;
switch (_that) {
case _TariffModel():
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo,_that.tariffCategory,_that.package);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String updatedAt,  bool isActive,  String name,  String description,  String image,  int? id,  String? deletedAt,  int? icon,  int? sortIndex,  List<String>? fields,  int? tariffCategoryId,  double? length,  double? height,  double? width,  double? volumetricWeight,  double? weight,  double? invoiceWeight,  double? costPriceOfAirShipment,  int? packageId,  double? additionalCostForFragileCargo,  TariffCategoryModel? tariffCategory,  PackageModel? package)?  $default,) {final _that = this;
switch (_that) {
case _TariffModel() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.isActive,_that.name,_that.description,_that.image,_that.id,_that.deletedAt,_that.icon,_that.sortIndex,_that.fields,_that.tariffCategoryId,_that.length,_that.height,_that.width,_that.volumetricWeight,_that.weight,_that.invoiceWeight,_that.costPriceOfAirShipment,_that.packageId,_that.additionalCostForFragileCargo,_that.tariffCategory,_that.package);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TariffModel implements TariffModel {
  const _TariffModel({required this.createdAt, required this.updatedAt, required this.isActive, required this.name, required this.description, required this.image, this.id, this.deletedAt, this.icon, this.sortIndex, final  List<String>? fields, this.tariffCategoryId, this.length, this.height, this.width, this.volumetricWeight, this.weight, this.invoiceWeight, this.costPriceOfAirShipment, this.packageId, this.additionalCostForFragileCargo, this.tariffCategory, this.package}): _fields = fields;
  factory _TariffModel.fromJson(Map<String, dynamic> json) => _$TariffModelFromJson(json);

@override final  String createdAt;
@override final  String updatedAt;
@override final  bool isActive;
@override final  String name;
@override final  String description;
@override final  String image;
@override final  int? id;
@override final  String? deletedAt;
@override final  int? icon;
@override final  int? sortIndex;
 final  List<String>? _fields;
@override List<String>? get fields {
  final value = _fields;
  if (value == null) return null;
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? tariffCategoryId;
@override final  double? length;
@override final  double? height;
@override final  double? width;
@override final  double? volumetricWeight;
@override final  double? weight;
@override final  double? invoiceWeight;
@override final  double? costPriceOfAirShipment;
@override final  int? packageId;
@override final  double? additionalCostForFragileCargo;
@override final  TariffCategoryModel? tariffCategory;
@override final  PackageModel? package;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffModel&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.id, id) || other.id == id)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&(identical(other.width, width) || other.width == width)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.tariffCategory, tariffCategory) || other.tariffCategory == tariffCategory)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,createdAt,updatedAt,isActive,name,description,image,id,deletedAt,icon,sortIndex,const DeepCollectionEquality().hash(_fields),tariffCategoryId,length,height,width,volumetricWeight,weight,invoiceWeight,costPriceOfAirShipment,packageId,additionalCostForFragileCargo,tariffCategory,package]);

@override
String toString() {
  return 'TariffModel(createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, name: $name, description: $description, image: $image, id: $id, deletedAt: $deletedAt, icon: $icon, sortIndex: $sortIndex, fields: $fields, tariffCategoryId: $tariffCategoryId, length: $length, height: $height, width: $width, volumetricWeight: $volumetricWeight, weight: $weight, invoiceWeight: $invoiceWeight, costPriceOfAirShipment: $costPriceOfAirShipment, packageId: $packageId, additionalCostForFragileCargo: $additionalCostForFragileCargo, tariffCategory: $tariffCategory, package: $package)';
}


}

/// @nodoc
abstract mixin class _$TariffModelCopyWith<$Res> implements $TariffModelCopyWith<$Res> {
  factory _$TariffModelCopyWith(_TariffModel value, $Res Function(_TariffModel) _then) = __$TariffModelCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String updatedAt, bool isActive, String name, String description, String image, int? id, String? deletedAt, int? icon, int? sortIndex, List<String>? fields, int? tariffCategoryId, double? length, double? height, double? width, double? volumetricWeight, double? weight, double? invoiceWeight, double? costPriceOfAirShipment, int? packageId, double? additionalCostForFragileCargo, TariffCategoryModel? tariffCategory, PackageModel? package
});


@override $TariffCategoryModelCopyWith<$Res>? get tariffCategory;@override $PackageModelCopyWith<$Res>? get package;

}
/// @nodoc
class __$TariffModelCopyWithImpl<$Res>
    implements _$TariffModelCopyWith<$Res> {
  __$TariffModelCopyWithImpl(this._self, this._then);

  final _TariffModel _self;
  final $Res Function(_TariffModel) _then;

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? name = null,Object? description = null,Object? image = null,Object? id = freezed,Object? deletedAt = freezed,Object? icon = freezed,Object? sortIndex = freezed,Object? fields = freezed,Object? tariffCategoryId = freezed,Object? length = freezed,Object? height = freezed,Object? width = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? invoiceWeight = freezed,Object? costPriceOfAirShipment = freezed,Object? packageId = freezed,Object? additionalCostForFragileCargo = freezed,Object? tariffCategory = freezed,Object? package = freezed,}) {
  return _then(_TariffModel(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,fields: freezed == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,tariffCategory: freezed == tariffCategory ? _self.tariffCategory : tariffCategory // ignore: cast_nullable_to_non_nullable
as TariffCategoryModel?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageModel?,
  ));
}

/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TariffCategoryModelCopyWith<$Res>? get tariffCategory {
    if (_self.tariffCategory == null) {
    return null;
  }

  return $TariffCategoryModelCopyWith<$Res>(_self.tariffCategory!, (value) {
    return _then(_self.copyWith(tariffCategory: value));
  });
}/// Create a copy of TariffModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageModelCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageModelCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

// dart format on
