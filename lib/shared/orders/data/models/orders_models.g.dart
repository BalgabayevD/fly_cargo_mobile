// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) =>
    CreateOrderRequest(
      isDefect: json['isDefect'] as bool,
      isFragile: json['isFragile'] as bool,
      category: json['category'] as String,
      comment: json['comment'] as String,
      contentPhotos: (json['contentPhotos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
      fromAddress: json['fromAddress'] as String,
      fromApartment: json['fromApartment'] as String,
      fromCityId: (json['fromCityId'] as num).toInt(),
      fromEntrance: json['fromEntrance'] as String,
      fromFloor: json['fromFloor'] as String,
      fromLatitude: (json['fromLatitude'] as num).toDouble(),
      fromLongitude: (json['fromLongitude'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      length: (json['length'] as num).toDouble(),
      photos: (json['photos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tariffId: (json['tariffId'] as num).toInt(),
      toAddress: json['toAddress'] as String,
      toApartment: json['toApartment'] as String,
      toCityId: (json['toCityId'] as num).toInt(),
      toEntrance: json['toEntrance'] as String,
      toFloor: json['toFloor'] as String,
      toLatitude: (json['toLatitude'] as num).toDouble(),
      toLongitude: (json['toLongitude'] as num).toDouble(),
      volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) =>
    <String, dynamic>{
      'isDefect': instance.isDefect,
      'isFragile': instance.isFragile,
      'category': instance.category,
      'comment': instance.comment,
      'contentPhotos': instance.contentPhotos,
      'description': instance.description,
      'fromAddress': instance.fromAddress,
      'fromApartment': instance.fromApartment,
      'fromCityId': instance.fromCityId,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'height': instance.height,
      'length': instance.length,
      'photos': instance.photos,
      'tariffId': instance.tariffId,
      'toAddress': instance.toAddress,
      'toApartment': instance.toApartment,
      'toCityId': instance.toCityId,
      'toEntrance': instance.toEntrance,
      'toFloor': instance.toFloor,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
    };

CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    CreateOrderResponse(
      data: OrderModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
  CreateOrderResponse instance,
) => <String, dynamic>{'data': instance.data};

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  id: (json['id'] as num).toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  fromCityId: (json['fromCityId'] as num).toInt(),
  fromLatitude: (json['fromLatitude'] as num).toDouble(),
  fromLongitude: (json['fromLongitude'] as num).toDouble(),
  fromApartment: json['fromApartment'] as String,
  fromEntrance: json['fromEntrance'] as String,
  fromFloor: json['fromFloor'] as String,
  fromAddress: json['fromAddress'] as String,
  toCityId: (json['toCityId'] as num).toInt(),
  toLatitude: (json['toLatitude'] as num).toDouble(),
  toLongitude: (json['toLongitude'] as num).toDouble(),
  toApartment: json['toApartment'] as String,
  toEntrance: json['toEntrance'] as String,
  toFloor: json['toFloor'] as String,
  toAddress: json['toAddress'] as String,
  price: (json['price'] as num).toDouble(),
  tariffId: (json['tariffId'] as num).toInt(),
  tariff: json['tariff'] == null
      ? null
      : TariffModel.fromJson(json['tariff'] as Map<String, dynamic>),
  comment: json['comment'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  isPaid: json['isPaid'] as bool,
  isFragile: json['isFragile'] as bool,
  isDefect: json['isDefect'] as bool,
  photos: (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
  contentPhotos: (json['contentPhotos'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  defectPhotos: (json['defectPhotos'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  volumetricWeight: (json['volumetricWeight'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  length: (json['length'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  fromCity: json['fromCity'] == null
      ? null
      : CityModel.fromJson(json['fromCity'] as Map<String, dynamic>),
  toCity: json['toCity'] == null
      ? null
      : CityModel.fromJson(json['toCity'] as Map<String, dynamic>),
  participants: (json['participants'] as List<dynamic>)
      .map((e) => ParticipantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  qrs: json['qrs'] as List<dynamic>,
  calculationId: (json['calculationId'] as num).toInt(),
  priceCalculations: json['priceCalculations'] == null
      ? null
      : PriceCalculationModel.fromJson(
          json['priceCalculations'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'fromCityId': instance.fromCityId,
      'fromLatitude': instance.fromLatitude,
      'fromLongitude': instance.fromLongitude,
      'fromApartment': instance.fromApartment,
      'fromEntrance': instance.fromEntrance,
      'fromFloor': instance.fromFloor,
      'fromAddress': instance.fromAddress,
      'toCityId': instance.toCityId,
      'toLatitude': instance.toLatitude,
      'toLongitude': instance.toLongitude,
      'toApartment': instance.toApartment,
      'toEntrance': instance.toEntrance,
      'toFloor': instance.toFloor,
      'toAddress': instance.toAddress,
      'price': instance.price,
      'tariffId': instance.tariffId,
      'tariff': instance.tariff,
      'comment': instance.comment,
      'description': instance.description,
      'category': instance.category,
      'isPaid': instance.isPaid,
      'isFragile': instance.isFragile,
      'isDefect': instance.isDefect,
      'photos': instance.photos,
      'contentPhotos': instance.contentPhotos,
      'defectPhotos': instance.defectPhotos,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'width': instance.width,
      'length': instance.length,
      'height': instance.height,
      'fromCity': instance.fromCity,
      'toCity': instance.toCity,
      'participants': instance.participants,
      'qrs': instance.qrs,
      'calculationId': instance.calculationId,
      'priceCalculations': instance.priceCalculations,
    };

TariffModel _$TariffModelFromJson(Map<String, dynamic> json) => TariffModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  description: json['description'] as String,
  icon: (json['icon'] as num?)?.toInt(),
  image: json['image'] as String,
  sortIndex: (json['sortIndex'] as num?)?.toInt(),
  fields: (json['fields'] as List<dynamic>?)?.map((e) => e as String).toList(),
  tariffCategoryId: (json['tariffCategoryId'] as num?)?.toInt(),
  length: (json['length'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  packageId: (json['packageId'] as num?)?.toInt(),
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
  tariffCategory: json['tariffCategory'] == null
      ? null
      : TariffCategoryModel.fromJson(
          json['tariffCategory'] as Map<String, dynamic>,
        ),
  package: json['package'] == null
      ? null
      : PackageModel.fromJson(json['package'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TariffModelToJson(TariffModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'isActive': instance.isActive,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'image': instance.image,
      'sortIndex': instance.sortIndex,
      'fields': instance.fields,
      'tariffCategoryId': instance.tariffCategoryId,
      'length': instance.length,
      'height': instance.height,
      'width': instance.width,
      'volumetricWeight': instance.volumetricWeight,
      'weight': instance.weight,
      'invoiceWeight': instance.invoiceWeight,
      'costPriceOfAirShipment': instance.costPriceOfAirShipment,
      'packageId': instance.packageId,
      'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
      'tariffCategory': instance.tariffCategory,
      'package': instance.package,
    };

TariffCategoryModel _$TariffCategoryModelFromJson(Map<String, dynamic> json) =>
    TariffCategoryModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      name: json['name'] as String,
      key: json['key'] as String,
      sortIndex: (json['sortIndex'] as num?)?.toInt(),
      active: json['active'] as bool,
      tariffs: (json['tariffs'] as List<dynamic>?)
          ?.map((e) => TariffModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TariffCategoryModelToJson(
  TariffCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'name': instance.name,
  'key': instance.key,
  'sortIndex': instance.sortIndex,
  'active': instance.active,
  'tariffs': instance.tariffs,
};

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  isActive: json['isActive'] as bool,
  name: json['name'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  price: (json['price'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'isActive': instance.isActive,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  country: json['country'] as String,
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  RoutesFrom: json['RoutesFrom'] as List<dynamic>?,
  RoutesTo: json['RoutesTo'] as List<dynamic>?,
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'country': instance.country,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'RoutesFrom': instance.RoutesFrom,
  'RoutesTo': instance.RoutesTo,
};

ParticipantModel _$ParticipantModelFromJson(Map<String, dynamic> json) =>
    ParticipantModel(
      id: (json['id'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      orderId: (json['orderId'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      target: json['target'] as String,
    );

Map<String, dynamic> _$ParticipantModelToJson(ParticipantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'orderId': instance.orderId,
      'userId': instance.userId,
      'user': instance.user,
      'target': instance.target,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  uuid: json['uuid'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  middleName: json['middleName'] as String,
  birthDay: json['birthDay'] as String,
  photo: json['photo'] as String,
  city: json['city'] as String,
  type: json['type'] as String,
  iin: json['iin'] as String,
  bin: json['bin'] as String,
  access: json['access'],
  role: json['role'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'uuid': instance.uuid,
  'email': instance.email,
  'phone': instance.phone,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'middleName': instance.middleName,
  'birthDay': instance.birthDay,
  'photo': instance.photo,
  'city': instance.city,
  'type': instance.type,
  'iin': instance.iin,
  'bin': instance.bin,
  'access': instance.access,
  'role': instance.role,
};

PriceCalculationModel _$PriceCalculationModelFromJson(
  Map<String, dynamic> json,
) => PriceCalculationModel(
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  deletedAt: json['deletedAt'] as String?,
  length: (json['length'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  volumetricWeight: (json['volumetricWeight'] as num?)?.toDouble(),
  weight: (json['weight'] as num?)?.toDouble(),
  invoiceWeight: (json['invoiceWeight'] as num?)?.toDouble(),
  costPriceOfAirShipment: (json['costPriceOfAirShipment'] as num?)?.toDouble(),
  totalCostOfAirCargoShipment: (json['totalCostOfAirCargoShipment'] as num?)
      ?.toDouble(),
  courierExpensesAroundTheCityFromFixedSalary:
      (json['courierExpensesAroundTheCityFromFixedSalary'] as num?)?.toDouble(),
  courierExpensesAroundTheCityUponReceiptIfGoods:
      (json['courierExpensesAroundTheCityUponReceiptIfGoods'] as num?)
          ?.toDouble(),
  averageCourierFuelOerOrder: (json['averageCourierFuelOerOrder'] as num?)
      ?.toDouble(),
  carDepreciationExpense: (json['carDepreciationExpense'] as num?)?.toDouble(),
  averageProductPackagingPerUnit:
      (json['averageProductPackagingPerUnit'] as num?)?.toDouble(),
  additionalCostForFragileCargo: (json['additionalCostForFragileCargo'] as num?)
      ?.toDouble(),
  tax: (json['tax'] as num?)?.toDouble(),
  bankCommission: (json['bankCommission'] as num?)?.toDouble(),
  tariffCostInExpenses: (json['tariffCostInExpenses'] as num?)?.toDouble(),
  sellingPrice: (json['sellingPrice'] as num?)?.toDouble(),
  salesRevenue: (json['salesRevenue'] as num?)?.toDouble(),
  totalConsumptionPerOrder: (json['totalConsumptionPerOrder'] as num?)
      ?.toDouble(),
  marginality: (json['marginality'] as num?)?.toDouble(),
  netProfit: (json['netProfit'] as num?)?.toDouble(),
  orderProfitabilityPercentage: (json['orderProfitabilityPercentage'] as num?)
      ?.toDouble(),
  plannedMarkup: (json['plannedMarkup'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PriceCalculationModelToJson(
  PriceCalculationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'length': instance.length,
  'height': instance.height,
  'width': instance.width,
  'volumetricWeight': instance.volumetricWeight,
  'weight': instance.weight,
  'invoiceWeight': instance.invoiceWeight,
  'costPriceOfAirShipment': instance.costPriceOfAirShipment,
  'totalCostOfAirCargoShipment': instance.totalCostOfAirCargoShipment,
  'courierExpensesAroundTheCityFromFixedSalary':
      instance.courierExpensesAroundTheCityFromFixedSalary,
  'courierExpensesAroundTheCityUponReceiptIfGoods':
      instance.courierExpensesAroundTheCityUponReceiptIfGoods,
  'averageCourierFuelOerOrder': instance.averageCourierFuelOerOrder,
  'carDepreciationExpense': instance.carDepreciationExpense,
  'averageProductPackagingPerUnit': instance.averageProductPackagingPerUnit,
  'additionalCostForFragileCargo': instance.additionalCostForFragileCargo,
  'tax': instance.tax,
  'bankCommission': instance.bankCommission,
  'tariffCostInExpenses': instance.tariffCostInExpenses,
  'sellingPrice': instance.sellingPrice,
  'salesRevenue': instance.salesRevenue,
  'totalConsumptionPerOrder': instance.totalConsumptionPerOrder,
  'marginality': instance.marginality,
  'netProfit': instance.netProfit,
  'orderProfitabilityPercentage': instance.orderProfitabilityPercentage,
  'plannedMarkup': instance.plannedMarkup,
};
