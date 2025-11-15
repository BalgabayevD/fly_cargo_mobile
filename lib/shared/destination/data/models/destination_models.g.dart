part of 'destination_models.dart';





CitiesFromResponse _$CitiesFromResponseFromJson(Map<String, dynamic> json) =>
    CitiesFromResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ApiCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesFromResponseToJson(CitiesFromResponse instance) =>
    <String, dynamic>{'data': instance.data};

CitiesToResponse _$CitiesToResponseFromJson(Map<String, dynamic> json) =>
    CitiesToResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ApiCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesToResponseToJson(CitiesToResponse instance) =>
    <String, dynamic>{'data': instance.data};

ApiCityModel _$ApiCityModelFromJson(Map<String, dynamic> json) => ApiCityModel(
  id: ApiCityModel._idFromJson(json['id']),
  name: json['name'] as String,
  region: json['region'] as String?,
);

Map<String, dynamic> _$ApiCityModelToJson(ApiCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
    };

AddressSuggestionsResponse _$AddressSuggestionsResponseFromJson(
  Map<String, dynamic> json,
) => AddressSuggestionsResponse(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => AddressSuggestionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AddressSuggestionsResponseToJson(
  AddressSuggestionsResponse instance,
) => <String, dynamic>{'data': instance.data};

AddressSuggestionModel _$AddressSuggestionModelFromJson(
  Map<String, dynamic> json,
) => AddressSuggestionModel(title: json['title'] as String);

Map<String, dynamic> _$AddressSuggestionModelToJson(
  AddressSuggestionModel instance,
) => <String, dynamic>{'title': instance.title};
