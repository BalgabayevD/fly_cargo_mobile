import 'package:json_annotation/json_annotation.dart';

part 'orders_models.g.dart';

// ========== Запрос создания заказа ==========

@JsonSerializable()
class CreateOrderRequest {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final List<String> contentPhotos;
  final String description;
  final String fromAddress;
  final String fromApartment;
  final int fromCityId;
  final String fromEntrance;
  final String fromFloor;
  final double fromLatitude;
  final double fromLongitude;
  final double height;
  final double length;
  final List<String> photos;
  final int tariffId;
  final String toAddress;
  final String toApartment;
  final int toCityId;
  final String toEntrance;
  final String toFloor;
  final double toLatitude;
  final double toLongitude;
  final String toName;
  final String toPhone;
  final double volumetricWeight;
  final double weight;
  final double width;

  const CreateOrderRequest({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.contentPhotos,
    required this.description,
    required this.fromAddress,
    required this.fromApartment,
    required this.fromCityId,
    required this.fromEntrance,
    required this.fromFloor,
    required this.fromLatitude,
    required this.fromLongitude,
    required this.height,
    required this.length,
    required this.photos,
    required this.tariffId,
    required this.toAddress,
    required this.toApartment,
    required this.toCityId,
    required this.toEntrance,
    required this.toFloor,
    required this.toLatitude,
    required this.toLongitude,
    required this.toName,
    required this.toPhone,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
  });

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);
}

// ========== Ответ создания заказа ==========

@JsonSerializable()
class CreateOrderResponse {
  final OrderModel data;

  const CreateOrderResponse({required this.data});

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderResponseToJson(this);
}

@JsonSerializable()
class OrderModel {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int fromCityId;
  final double fromLatitude;
  final double fromLongitude;
  final String fromApartment;
  final String fromEntrance;
  final String fromFloor;
  final String fromAddress;
  final int toCityId;
  final double toLatitude;
  final double toLongitude;
  final String toApartment;
  final String toEntrance;
  final String toFloor;
  final String toAddress;
  final double? price;
  final int tariffId;
  final TariffModel? tariff;
  final String comment;
  final String description;
  final String category;
  final bool isPaid;
  final bool isFragile;
  final bool isDefect;
  final List<String> photos;
  final List<String> contentPhotos;
  final List<String>? defectPhotos;
  final double volumetricWeight;
  final double weight;
  final double width;
  final double length;
  final double height;
  final CityModel? fromCity;
  final CityModel? toCity;
  final List<ParticipantModel> participants;
  final List<dynamic> qrs;
  final int calculationId;
  final PriceCalculationModel? priceCalculations;

  const OrderModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.fromCityId,
    required this.fromLatitude,
    required this.fromLongitude,
    required this.fromApartment,
    required this.fromEntrance,
    required this.fromFloor,
    required this.fromAddress,
    required this.toCityId,
    required this.toLatitude,
    required this.toLongitude,
    required this.toApartment,
    required this.toEntrance,
    required this.toFloor,
    required this.toAddress,
    this.price,
    required this.tariffId,
    this.tariff,
    required this.comment,
    required this.description,
    required this.category,
    required this.isPaid,
    required this.isFragile,
    required this.isDefect,
    required this.photos,
    required this.contentPhotos,
    this.defectPhotos,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
    required this.length,
    required this.height,
    this.fromCity,
    this.toCity,
    required this.participants,
    required this.qrs,
    required this.calculationId,
    this.priceCalculations,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class TariffModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final bool isActive;
  final String name;
  final String description;
  final int? icon;
  final String image;
  final int? sortIndex;
  final List<String>? fields;
  final int? tariffCategoryId;
  final double? length;
  final double? height;
  final double? width;
  final double? volumetricWeight;
  final double? weight;
  final double? invoiceWeight;
  final double? costPriceOfAirShipment;
  final int? packageId;
  final double? additionalCostForFragileCargo;
  final TariffCategoryModel? tariffCategory;
  final PackageModel? package;

  const TariffModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isActive,
    required this.name,
    required this.description,
    this.icon,
    required this.image,
    this.sortIndex,
    this.fields,
    this.tariffCategoryId,
    this.length,
    this.height,
    this.width,
    this.volumetricWeight,
    this.weight,
    this.invoiceWeight,
    this.costPriceOfAirShipment,
    this.packageId,
    this.additionalCostForFragileCargo,
    this.tariffCategory,
    this.package,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) =>
      _$TariffModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffModelToJson(this);
}

@JsonSerializable()
class TariffCategoryModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String name;
  final String key;
  final int? sortIndex;
  final bool active;
  final List<TariffModel>? tariffs;

  const TariffCategoryModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.key,
    this.sortIndex,
    required this.active,
    this.tariffs,
  });

  factory TariffCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TariffCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TariffCategoryModelToJson(this);
}

@JsonSerializable()
class PackageModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final bool isActive;
  final String name;
  final String description;
  final String image;
  final double? price;

  const PackageModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.isActive,
    required this.name,
    required this.description,
    required this.image,
    this.price,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) =>
      _$PackageModelFromJson(json);

  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final int? id;
  final String name;
  final String country;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final List<dynamic>? RoutesFrom;
  final List<dynamic>? RoutesTo;

  const CityModel({
    this.id,
    required this.name,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.RoutesFrom,
    this.RoutesTo,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
class ParticipantModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int? orderId;
  final int? userId;
  final UserModel? user;
  final String target;

  const ParticipantModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.orderId,
    this.userId,
    this.user,
    required this.target,
  });

  factory ParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String uuid;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String middleName;
  final String birthDay;
  final String photo;
  final String city;
  final String type;
  final String iin;
  final String bin;
  final dynamic access;
  final String role;

  const UserModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.uuid,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.birthDay,
    required this.photo,
    required this.city,
    required this.type,
    required this.iin,
    required this.bin,
    this.access,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class PriceCalculationModel {
  final int? id;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final double? length;
  final double? height;
  final double? width;
  final double? volumetricWeight;
  final double? weight;
  final double? invoiceWeight;
  final double? costPriceOfAirShipment;
  final double? totalCostOfAirCargoShipment;
  final double? courierExpensesAroundTheCityFromFixedSalary;
  final double? courierExpensesAroundTheCityUponReceiptIfGoods;
  final double? averageCourierFuelOerOrder;
  final double? carDepreciationExpense;
  final double? averageProductPackagingPerUnit;
  final double? additionalCostForFragileCargo;
  final double? tax;
  final double? bankCommission;
  final double? tariffCostInExpenses;
  final double? sellingPrice;
  final double? salesRevenue;
  final double? totalConsumptionPerOrder;
  final double? marginality;
  final double? netProfit;
  final double? orderProfitabilityPercentage;
  final double? plannedMarkup;

  const PriceCalculationModel({
    this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.length,
    this.height,
    this.width,
    this.volumetricWeight,
    this.weight,
    this.invoiceWeight,
    this.costPriceOfAirShipment,
    this.totalCostOfAirCargoShipment,
    this.courierExpensesAroundTheCityFromFixedSalary,
    this.courierExpensesAroundTheCityUponReceiptIfGoods,
    this.averageCourierFuelOerOrder,
    this.carDepreciationExpense,
    this.averageProductPackagingPerUnit,
    this.additionalCostForFragileCargo,
    this.tax,
    this.bankCommission,
    this.tariffCostInExpenses,
    this.sellingPrice,
    this.salesRevenue,
    this.totalConsumptionPerOrder,
    this.marginality,
    this.netProfit,
    this.orderProfitabilityPercentage,
    this.plannedMarkup,
  });

  factory PriceCalculationModel.fromJson(Map<String, dynamic> json) =>
      _$PriceCalculationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceCalculationModelToJson(this);
}

// ========== Domain модели ==========

class OrderData {
  final bool isDefect;
  final bool isFragile;
  final String category;
  final String comment;
  final List<String> contentPhotos;
  final String description;
  final String fromAddress;
  final String fromApartment;
  final int fromCityId;
  final String fromEntrance;
  final String fromFloor;
  final double fromLatitude;
  final double fromLongitude;
  final double height;
  final double length;
  final List<String> photos;
  final int tariffId;
  final String toAddress;
  final String toApartment;
  final int toCityId;
  final String toEntrance;
  final String toFloor;
  final double toLatitude;
  final double toLongitude;
  final String toName;
  final String toPhone;
  final double volumetricWeight;
  final double weight;
  final double width;

  const OrderData({
    required this.isDefect,
    required this.isFragile,
    required this.category,
    required this.comment,
    required this.contentPhotos,
    required this.description,
    required this.fromAddress,
    required this.fromApartment,
    required this.fromCityId,
    required this.fromEntrance,
    required this.fromFloor,
    required this.fromLatitude,
    required this.fromLongitude,
    required this.height,
    required this.length,
    required this.photos,
    required this.tariffId,
    required this.toAddress,
    required this.toApartment,
    required this.toCityId,
    required this.toEntrance,
    required this.toFloor,
    required this.toLatitude,
    required this.toLongitude,
    required this.toName,
    required this.toPhone,
    required this.volumetricWeight,
    required this.weight,
    required this.width,
  });

  CreateOrderRequest toCreateOrderRequest() {
    return CreateOrderRequest(
      isDefect: isDefect,
      isFragile: isFragile,
      category: category,
      comment: comment,
      contentPhotos: contentPhotos,
      description: description,
      fromAddress: fromAddress,
      fromApartment: fromApartment,
      fromCityId: fromCityId,
      fromEntrance: fromEntrance,
      fromFloor: fromFloor,
      fromLatitude: fromLatitude,
      fromLongitude: fromLongitude,
      height: height,
      length: length,
      photos: photos,
      tariffId: tariffId,
      toAddress: toAddress,
      toApartment: toApartment,
      toCityId: toCityId,
      toEntrance: toEntrance,
      toFloor: toFloor,
      toLatitude: toLatitude,
      toLongitude: toLongitude,
      toName: toName,
      toPhone: toPhone,
      volumetricWeight: volumetricWeight,
      weight: weight,
      width: width,
    );
  }
}

class OrderResult {
  final int orderId;
  final String status;
  final String message;

  const OrderResult({
    required this.orderId,
    required this.status,
    required this.message,
  });

  factory OrderResult.fromOrderModel(OrderModel order) {
    return OrderResult(
      orderId: order.id,
      status: 'created',
      message: 'Заказ успешно создан',
    );
  }
}
