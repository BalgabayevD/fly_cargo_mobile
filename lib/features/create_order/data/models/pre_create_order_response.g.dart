// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_create_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreCreateOrderData _$PreCreateOrderDataFromJson(Map<String, dynamic> json) =>
    _PreCreateOrderData(
      weight: (json['weight'] as num).toDouble(),
      tariffId: (json['tariffId'] as num).toInt(),
      description: json['description'] as String,
      height: (json['height'] as num).toInt(),
      length: (json['length'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$PreCreateOrderDataToJson(_PreCreateOrderData instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'tariffId': instance.tariffId,
      'description': instance.description,
      'height': instance.height,
      'length': instance.length,
      'width': instance.width,
    };

_PreCreateOrderResult _$PreCreateOrderResultFromJson(
  Map<String, dynamic> json,
) => _PreCreateOrderResult(
  status: $enumDecode(_$AnalysisStatusEnumMap, json['status']),
  success: json['success'] as bool,
  result: PreCreateOrderData.fromJson(json['result'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PreCreateOrderResultToJson(
  _PreCreateOrderResult instance,
) => <String, dynamic>{
  'status': _$AnalysisStatusEnumMap[instance.status]!,
  'success': instance.success,
  'result': instance.result,
};

const _$AnalysisStatusEnumMap = {
  AnalysisStatus.none: 'NONE',
  AnalysisStatus.morePhotoInside: 'MORE_PHOTO_INSIDE',
  AnalysisStatus.morePhotoOutside: 'MORE_PHOTO_OUTSIDE',
};

_PreCreateOrderResponse _$PreCreateOrderResponseFromJson(
  Map<String, dynamic> json,
) => _PreCreateOrderResponse(
  success: json['success'] as bool,
  code: (json['code'] as num).toInt(),
  description: json['description'] as String,
  data: json['data'] == null
      ? null
      : PreCreateOrderResult.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PreCreateOrderResponseToJson(
  _PreCreateOrderResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'code': instance.code,
  'description': instance.description,
  'data': instance.data,
};
