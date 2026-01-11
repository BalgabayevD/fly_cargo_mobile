// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tariff_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PackageEntity {

 String get createdAt; String get description; String get image; bool get isActive; String get name; String get updatedAt; String? get deletedAt; int? get id; double? get price;
/// Create a copy of PackageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageEntityCopyWith<PackageEntity> get copyWith => _$PackageEntityCopyWithImpl<PackageEntity>(this as PackageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,description,image,isActive,name,updatedAt,deletedAt,id,price);

@override
String toString() {
  return 'PackageEntity(createdAt: $createdAt, description: $description, image: $image, isActive: $isActive, name: $name, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id, price: $price)';
}


}

/// @nodoc
abstract mixin class $PackageEntityCopyWith<$Res>  {
  factory $PackageEntityCopyWith(PackageEntity value, $Res Function(PackageEntity) _then) = _$PackageEntityCopyWithImpl;
@useResult
$Res call({
 String createdAt, String description, String image, bool isActive, String name, String updatedAt, String? deletedAt, int? id, double? price
});




}
/// @nodoc
class _$PackageEntityCopyWithImpl<$Res>
    implements $PackageEntityCopyWith<$Res> {
  _$PackageEntityCopyWithImpl(this._self, this._then);

  final PackageEntity _self;
  final $Res Function(PackageEntity) _then;

/// Create a copy of PackageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? description = null,Object? image = null,Object? isActive = null,Object? name = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? id = freezed,Object? price = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageEntity].
extension PackageEntityPatterns on PackageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageEntity value)  $default,){
final _that = this;
switch (_that) {
case _PackageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PackageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String description,  String image,  bool isActive,  String name,  String updatedAt,  String? deletedAt,  int? id,  double? price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageEntity() when $default != null:
return $default(_that.createdAt,_that.description,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String description,  String image,  bool isActive,  String name,  String updatedAt,  String? deletedAt,  int? id,  double? price)  $default,) {final _that = this;
switch (_that) {
case _PackageEntity():
return $default(_that.createdAt,_that.description,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.price);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String description,  String image,  bool isActive,  String name,  String updatedAt,  String? deletedAt,  int? id,  double? price)?  $default,) {final _that = this;
switch (_that) {
case _PackageEntity() when $default != null:
return $default(_that.createdAt,_that.description,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _PackageEntity implements PackageEntity {
  const _PackageEntity({required this.createdAt, required this.description, required this.image, required this.isActive, required this.name, required this.updatedAt, this.deletedAt, this.id, this.price});
  

@override final  String createdAt;
@override final  String description;
@override final  String image;
@override final  bool isActive;
@override final  String name;
@override final  String updatedAt;
@override final  String? deletedAt;
@override final  int? id;
@override final  double? price;

/// Create a copy of PackageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageEntityCopyWith<_PackageEntity> get copyWith => __$PackageEntityCopyWithImpl<_PackageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,createdAt,description,image,isActive,name,updatedAt,deletedAt,id,price);

@override
String toString() {
  return 'PackageEntity(createdAt: $createdAt, description: $description, image: $image, isActive: $isActive, name: $name, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id, price: $price)';
}


}

/// @nodoc
abstract mixin class _$PackageEntityCopyWith<$Res> implements $PackageEntityCopyWith<$Res> {
  factory _$PackageEntityCopyWith(_PackageEntity value, $Res Function(_PackageEntity) _then) = __$PackageEntityCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String description, String image, bool isActive, String name, String updatedAt, String? deletedAt, int? id, double? price
});




}
/// @nodoc
class __$PackageEntityCopyWithImpl<$Res>
    implements _$PackageEntityCopyWith<$Res> {
  __$PackageEntityCopyWithImpl(this._self, this._then);

  final _PackageEntity _self;
  final $Res Function(_PackageEntity) _then;

/// Create a copy of PackageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? description = null,Object? image = null,Object? isActive = null,Object? name = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? id = freezed,Object? price = freezed,}) {
  return _then(_PackageEntity(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$TariffEntity {

 String get createdAt; String get description; int get id; String get image; bool get isActive; String get name; String get updatedAt; double? get additionalCostForFragileCargo; double? get costPriceOfAirShipment; String? get deletedAt; List<String>? get fields; double? get height; double? get invoiceWeight; double? get length; PackageEntity? get package; int? get packageId; int? get sortIndex; int? get tariffCategoryId; double? get volumetricWeight; double? get weight; double? get width;
/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffEntityCopyWith<TariffEntity> get copyWith => _$TariffEntityCopyWithImpl<TariffEntity>(this as TariffEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.length, length) || other.length == length)&&(identical(other.package, package) || other.package == package)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}


@override
int get hashCode => Object.hashAll([runtimeType,createdAt,description,id,image,isActive,name,updatedAt,additionalCostForFragileCargo,costPriceOfAirShipment,deletedAt,const DeepCollectionEquality().hash(fields),height,invoiceWeight,length,package,packageId,sortIndex,tariffCategoryId,volumetricWeight,weight,width]);

@override
String toString() {
  return 'TariffEntity(createdAt: $createdAt, description: $description, id: $id, image: $image, isActive: $isActive, name: $name, updatedAt: $updatedAt, additionalCostForFragileCargo: $additionalCostForFragileCargo, costPriceOfAirShipment: $costPriceOfAirShipment, deletedAt: $deletedAt, fields: $fields, height: $height, invoiceWeight: $invoiceWeight, length: $length, package: $package, packageId: $packageId, sortIndex: $sortIndex, tariffCategoryId: $tariffCategoryId, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class $TariffEntityCopyWith<$Res>  {
  factory $TariffEntityCopyWith(TariffEntity value, $Res Function(TariffEntity) _then) = _$TariffEntityCopyWithImpl;
@useResult
$Res call({
 String createdAt, String description, int id, String image, bool isActive, String name, String updatedAt, double? additionalCostForFragileCargo, double? costPriceOfAirShipment, String? deletedAt, List<String>? fields, double? height, double? invoiceWeight, double? length, PackageEntity? package, int? packageId, int? sortIndex, int? tariffCategoryId, double? volumetricWeight, double? weight, double? width
});


$PackageEntityCopyWith<$Res>? get package;

}
/// @nodoc
class _$TariffEntityCopyWithImpl<$Res>
    implements $TariffEntityCopyWith<$Res> {
  _$TariffEntityCopyWithImpl(this._self, this._then);

  final TariffEntity _self;
  final $Res Function(TariffEntity) _then;

/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? description = null,Object? id = null,Object? image = null,Object? isActive = null,Object? name = null,Object? updatedAt = null,Object? additionalCostForFragileCargo = freezed,Object? costPriceOfAirShipment = freezed,Object? deletedAt = freezed,Object? fields = freezed,Object? height = freezed,Object? invoiceWeight = freezed,Object? length = freezed,Object? package = freezed,Object? packageId = freezed,Object? sortIndex = freezed,Object? tariffCategoryId = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? width = freezed,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fields: freezed == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageEntity?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}
/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageEntityCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageEntityCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [TariffEntity].
extension TariffEntityPatterns on TariffEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffEntity value)  $default,){
final _that = this;
switch (_that) {
case _TariffEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TariffEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String createdAt,  String description,  int id,  String image,  bool isActive,  String name,  String updatedAt,  double? additionalCostForFragileCargo,  double? costPriceOfAirShipment,  String? deletedAt,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  PackageEntity? package,  int? packageId,  int? sortIndex,  int? tariffCategoryId,  double? volumetricWeight,  double? weight,  double? width)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffEntity() when $default != null:
return $default(_that.createdAt,_that.description,_that.id,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.deletedAt,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.package,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String createdAt,  String description,  int id,  String image,  bool isActive,  String name,  String updatedAt,  double? additionalCostForFragileCargo,  double? costPriceOfAirShipment,  String? deletedAt,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  PackageEntity? package,  int? packageId,  int? sortIndex,  int? tariffCategoryId,  double? volumetricWeight,  double? weight,  double? width)  $default,) {final _that = this;
switch (_that) {
case _TariffEntity():
return $default(_that.createdAt,_that.description,_that.id,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.deletedAt,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.package,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String createdAt,  String description,  int id,  String image,  bool isActive,  String name,  String updatedAt,  double? additionalCostForFragileCargo,  double? costPriceOfAirShipment,  String? deletedAt,  List<String>? fields,  double? height,  double? invoiceWeight,  double? length,  PackageEntity? package,  int? packageId,  int? sortIndex,  int? tariffCategoryId,  double? volumetricWeight,  double? weight,  double? width)?  $default,) {final _that = this;
switch (_that) {
case _TariffEntity() when $default != null:
return $default(_that.createdAt,_that.description,_that.id,_that.image,_that.isActive,_that.name,_that.updatedAt,_that.additionalCostForFragileCargo,_that.costPriceOfAirShipment,_that.deletedAt,_that.fields,_that.height,_that.invoiceWeight,_that.length,_that.package,_that.packageId,_that.sortIndex,_that.tariffCategoryId,_that.volumetricWeight,_that.weight,_that.width);case _:
  return null;

}
}

}

/// @nodoc


class _TariffEntity implements TariffEntity {
  const _TariffEntity({required this.createdAt, required this.description, required this.id, required this.image, required this.isActive, required this.name, required this.updatedAt, this.additionalCostForFragileCargo, this.costPriceOfAirShipment, this.deletedAt, final  List<String>? fields, this.height, this.invoiceWeight, this.length, this.package, this.packageId, this.sortIndex, this.tariffCategoryId, this.volumetricWeight, this.weight, this.width}): _fields = fields;
  

@override final  String createdAt;
@override final  String description;
@override final  int id;
@override final  String image;
@override final  bool isActive;
@override final  String name;
@override final  String updatedAt;
@override final  double? additionalCostForFragileCargo;
@override final  double? costPriceOfAirShipment;
@override final  String? deletedAt;
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
@override final  PackageEntity? package;
@override final  int? packageId;
@override final  int? sortIndex;
@override final  int? tariffCategoryId;
@override final  double? volumetricWeight;
@override final  double? weight;
@override final  double? width;

/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffEntityCopyWith<_TariffEntity> get copyWith => __$TariffEntityCopyWithImpl<_TariffEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.id, id) || other.id == id)&&(identical(other.image, image) || other.image == image)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.additionalCostForFragileCargo, additionalCostForFragileCargo) || other.additionalCostForFragileCargo == additionalCostForFragileCargo)&&(identical(other.costPriceOfAirShipment, costPriceOfAirShipment) || other.costPriceOfAirShipment == costPriceOfAirShipment)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.height, height) || other.height == height)&&(identical(other.invoiceWeight, invoiceWeight) || other.invoiceWeight == invoiceWeight)&&(identical(other.length, length) || other.length == length)&&(identical(other.package, package) || other.package == package)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&(identical(other.tariffCategoryId, tariffCategoryId) || other.tariffCategoryId == tariffCategoryId)&&(identical(other.volumetricWeight, volumetricWeight) || other.volumetricWeight == volumetricWeight)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.width, width) || other.width == width));
}


@override
int get hashCode => Object.hashAll([runtimeType,createdAt,description,id,image,isActive,name,updatedAt,additionalCostForFragileCargo,costPriceOfAirShipment,deletedAt,const DeepCollectionEquality().hash(_fields),height,invoiceWeight,length,package,packageId,sortIndex,tariffCategoryId,volumetricWeight,weight,width]);

@override
String toString() {
  return 'TariffEntity(createdAt: $createdAt, description: $description, id: $id, image: $image, isActive: $isActive, name: $name, updatedAt: $updatedAt, additionalCostForFragileCargo: $additionalCostForFragileCargo, costPriceOfAirShipment: $costPriceOfAirShipment, deletedAt: $deletedAt, fields: $fields, height: $height, invoiceWeight: $invoiceWeight, length: $length, package: $package, packageId: $packageId, sortIndex: $sortIndex, tariffCategoryId: $tariffCategoryId, volumetricWeight: $volumetricWeight, weight: $weight, width: $width)';
}


}

/// @nodoc
abstract mixin class _$TariffEntityCopyWith<$Res> implements $TariffEntityCopyWith<$Res> {
  factory _$TariffEntityCopyWith(_TariffEntity value, $Res Function(_TariffEntity) _then) = __$TariffEntityCopyWithImpl;
@override @useResult
$Res call({
 String createdAt, String description, int id, String image, bool isActive, String name, String updatedAt, double? additionalCostForFragileCargo, double? costPriceOfAirShipment, String? deletedAt, List<String>? fields, double? height, double? invoiceWeight, double? length, PackageEntity? package, int? packageId, int? sortIndex, int? tariffCategoryId, double? volumetricWeight, double? weight, double? width
});


@override $PackageEntityCopyWith<$Res>? get package;

}
/// @nodoc
class __$TariffEntityCopyWithImpl<$Res>
    implements _$TariffEntityCopyWith<$Res> {
  __$TariffEntityCopyWithImpl(this._self, this._then);

  final _TariffEntity _self;
  final $Res Function(_TariffEntity) _then;

/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? description = null,Object? id = null,Object? image = null,Object? isActive = null,Object? name = null,Object? updatedAt = null,Object? additionalCostForFragileCargo = freezed,Object? costPriceOfAirShipment = freezed,Object? deletedAt = freezed,Object? fields = freezed,Object? height = freezed,Object? invoiceWeight = freezed,Object? length = freezed,Object? package = freezed,Object? packageId = freezed,Object? sortIndex = freezed,Object? tariffCategoryId = freezed,Object? volumetricWeight = freezed,Object? weight = freezed,Object? width = freezed,}) {
  return _then(_TariffEntity(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,additionalCostForFragileCargo: freezed == additionalCostForFragileCargo ? _self.additionalCostForFragileCargo : additionalCostForFragileCargo // ignore: cast_nullable_to_non_nullable
as double?,costPriceOfAirShipment: freezed == costPriceOfAirShipment ? _self.costPriceOfAirShipment : costPriceOfAirShipment // ignore: cast_nullable_to_non_nullable
as double?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,fields: freezed == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,invoiceWeight: freezed == invoiceWeight ? _self.invoiceWeight : invoiceWeight // ignore: cast_nullable_to_non_nullable
as double?,length: freezed == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double?,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as PackageEntity?,packageId: freezed == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,tariffCategoryId: freezed == tariffCategoryId ? _self.tariffCategoryId : tariffCategoryId // ignore: cast_nullable_to_non_nullable
as int?,volumetricWeight: freezed == volumetricWeight ? _self.volumetricWeight : volumetricWeight // ignore: cast_nullable_to_non_nullable
as double?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

/// Create a copy of TariffEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageEntityCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $PackageEntityCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

/// @nodoc
mixin _$TariffCategoryEntity {

 bool get active; String get createdAt; String get key; String get name; String get updatedAt; String? get deletedAt; int? get id; int? get sortIndex; List<TariffEntity>? get tariffs;
/// Create a copy of TariffCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TariffCategoryEntityCopyWith<TariffCategoryEntity> get copyWith => _$TariffCategoryEntityCopyWithImpl<TariffCategoryEntity>(this as TariffCategoryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TariffCategoryEntity&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other.tariffs, tariffs));
}


@override
int get hashCode => Object.hash(runtimeType,active,createdAt,key,name,updatedAt,deletedAt,id,sortIndex,const DeepCollectionEquality().hash(tariffs));

@override
String toString() {
  return 'TariffCategoryEntity(active: $active, createdAt: $createdAt, key: $key, name: $name, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id, sortIndex: $sortIndex, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class $TariffCategoryEntityCopyWith<$Res>  {
  factory $TariffCategoryEntityCopyWith(TariffCategoryEntity value, $Res Function(TariffCategoryEntity) _then) = _$TariffCategoryEntityCopyWithImpl;
@useResult
$Res call({
 bool active, String createdAt, String key, String name, String updatedAt, String? deletedAt, int? id, int? sortIndex, List<TariffEntity>? tariffs
});




}
/// @nodoc
class _$TariffCategoryEntityCopyWithImpl<$Res>
    implements $TariffCategoryEntityCopyWith<$Res> {
  _$TariffCategoryEntityCopyWithImpl(this._self, this._then);

  final TariffCategoryEntity _self;
  final $Res Function(TariffCategoryEntity) _then;

/// Create a copy of TariffCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,Object? createdAt = null,Object? key = null,Object? name = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? id = freezed,Object? sortIndex = freezed,Object? tariffs = freezed,}) {
  return _then(_self.copyWith(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,tariffs: freezed == tariffs ? _self.tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TariffCategoryEntity].
extension TariffCategoryEntityPatterns on TariffCategoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TariffCategoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TariffCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TariffCategoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TariffCategoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TariffCategoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool active,  String createdAt,  String key,  String name,  String updatedAt,  String? deletedAt,  int? id,  int? sortIndex,  List<TariffEntity>? tariffs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TariffCategoryEntity() when $default != null:
return $default(_that.active,_that.createdAt,_that.key,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.sortIndex,_that.tariffs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool active,  String createdAt,  String key,  String name,  String updatedAt,  String? deletedAt,  int? id,  int? sortIndex,  List<TariffEntity>? tariffs)  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryEntity():
return $default(_that.active,_that.createdAt,_that.key,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.sortIndex,_that.tariffs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool active,  String createdAt,  String key,  String name,  String updatedAt,  String? deletedAt,  int? id,  int? sortIndex,  List<TariffEntity>? tariffs)?  $default,) {final _that = this;
switch (_that) {
case _TariffCategoryEntity() when $default != null:
return $default(_that.active,_that.createdAt,_that.key,_that.name,_that.updatedAt,_that.deletedAt,_that.id,_that.sortIndex,_that.tariffs);case _:
  return null;

}
}

}

/// @nodoc


class _TariffCategoryEntity implements TariffCategoryEntity {
  const _TariffCategoryEntity({required this.active, required this.createdAt, required this.key, required this.name, required this.updatedAt, this.deletedAt, this.id, this.sortIndex, final  List<TariffEntity>? tariffs}): _tariffs = tariffs;
  

@override final  bool active;
@override final  String createdAt;
@override final  String key;
@override final  String name;
@override final  String updatedAt;
@override final  String? deletedAt;
@override final  int? id;
@override final  int? sortIndex;
 final  List<TariffEntity>? _tariffs;
@override List<TariffEntity>? get tariffs {
  final value = _tariffs;
  if (value == null) return null;
  if (_tariffs is EqualUnmodifiableListView) return _tariffs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TariffCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TariffCategoryEntityCopyWith<_TariffCategoryEntity> get copyWith => __$TariffCategoryEntityCopyWithImpl<_TariffCategoryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TariffCategoryEntity&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.sortIndex, sortIndex) || other.sortIndex == sortIndex)&&const DeepCollectionEquality().equals(other._tariffs, _tariffs));
}


@override
int get hashCode => Object.hash(runtimeType,active,createdAt,key,name,updatedAt,deletedAt,id,sortIndex,const DeepCollectionEquality().hash(_tariffs));

@override
String toString() {
  return 'TariffCategoryEntity(active: $active, createdAt: $createdAt, key: $key, name: $name, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id, sortIndex: $sortIndex, tariffs: $tariffs)';
}


}

/// @nodoc
abstract mixin class _$TariffCategoryEntityCopyWith<$Res> implements $TariffCategoryEntityCopyWith<$Res> {
  factory _$TariffCategoryEntityCopyWith(_TariffCategoryEntity value, $Res Function(_TariffCategoryEntity) _then) = __$TariffCategoryEntityCopyWithImpl;
@override @useResult
$Res call({
 bool active, String createdAt, String key, String name, String updatedAt, String? deletedAt, int? id, int? sortIndex, List<TariffEntity>? tariffs
});




}
/// @nodoc
class __$TariffCategoryEntityCopyWithImpl<$Res>
    implements _$TariffCategoryEntityCopyWith<$Res> {
  __$TariffCategoryEntityCopyWithImpl(this._self, this._then);

  final _TariffCategoryEntity _self;
  final $Res Function(_TariffCategoryEntity) _then;

/// Create a copy of TariffCategoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,Object? createdAt = null,Object? key = null,Object? name = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? id = freezed,Object? sortIndex = freezed,Object? tariffs = freezed,}) {
  return _then(_TariffCategoryEntity(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,sortIndex: freezed == sortIndex ? _self.sortIndex : sortIndex // ignore: cast_nullable_to_non_nullable
as int?,tariffs: freezed == tariffs ? _self._tariffs : tariffs // ignore: cast_nullable_to_non_nullable
as List<TariffEntity>?,
  ));
}


}

/// @nodoc
mixin _$CreateTariffResultEntity {

 int get id; String get message; bool get success;
/// Create a copy of CreateTariffResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTariffResultEntityCopyWith<CreateTariffResultEntity> get copyWith => _$CreateTariffResultEntityCopyWithImpl<CreateTariffResultEntity>(this as CreateTariffResultEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTariffResultEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,id,message,success);

@override
String toString() {
  return 'CreateTariffResultEntity(id: $id, message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class $CreateTariffResultEntityCopyWith<$Res>  {
  factory $CreateTariffResultEntityCopyWith(CreateTariffResultEntity value, $Res Function(CreateTariffResultEntity) _then) = _$CreateTariffResultEntityCopyWithImpl;
@useResult
$Res call({
 int id, String message, bool success
});




}
/// @nodoc
class _$CreateTariffResultEntityCopyWithImpl<$Res>
    implements $CreateTariffResultEntityCopyWith<$Res> {
  _$CreateTariffResultEntityCopyWithImpl(this._self, this._then);

  final CreateTariffResultEntity _self;
  final $Res Function(CreateTariffResultEntity) _then;

/// Create a copy of CreateTariffResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? message = null,Object? success = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTariffResultEntity].
extension CreateTariffResultEntityPatterns on CreateTariffResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTariffResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTariffResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTariffResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _CreateTariffResultEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTariffResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTariffResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String message,  bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTariffResultEntity() when $default != null:
return $default(_that.id,_that.message,_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String message,  bool success)  $default,) {final _that = this;
switch (_that) {
case _CreateTariffResultEntity():
return $default(_that.id,_that.message,_that.success);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String message,  bool success)?  $default,) {final _that = this;
switch (_that) {
case _CreateTariffResultEntity() when $default != null:
return $default(_that.id,_that.message,_that.success);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTariffResultEntity implements CreateTariffResultEntity {
  const _CreateTariffResultEntity({required this.id, required this.message, required this.success});
  

@override final  int id;
@override final  String message;
@override final  bool success;

/// Create a copy of CreateTariffResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTariffResultEntityCopyWith<_CreateTariffResultEntity> get copyWith => __$CreateTariffResultEntityCopyWithImpl<_CreateTariffResultEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTariffResultEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,id,message,success);

@override
String toString() {
  return 'CreateTariffResultEntity(id: $id, message: $message, success: $success)';
}


}

/// @nodoc
abstract mixin class _$CreateTariffResultEntityCopyWith<$Res> implements $CreateTariffResultEntityCopyWith<$Res> {
  factory _$CreateTariffResultEntityCopyWith(_CreateTariffResultEntity value, $Res Function(_CreateTariffResultEntity) _then) = __$CreateTariffResultEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String message, bool success
});




}
/// @nodoc
class __$CreateTariffResultEntityCopyWithImpl<$Res>
    implements _$CreateTariffResultEntityCopyWith<$Res> {
  __$CreateTariffResultEntityCopyWithImpl(this._self, this._then);

  final _CreateTariffResultEntity _self;
  final $Res Function(_CreateTariffResultEntity) _then;

/// Create a copy of CreateTariffResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? message = null,Object? success = null,}) {
  return _then(_CreateTariffResultEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
