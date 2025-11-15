class AddressSuggestionModel {
  final String title;
  const AddressSuggestionModel({required this.title});
  factory AddressSuggestionModel.fromJson(Map<String, dynamic> json) {
    return AddressSuggestionModel(title: json['title'] as String);
  }
  Map<String, dynamic> toJson() {
    return {'title': title};
  }
}
class AddressSuggestionsResponseModel {
  final List<AddressSuggestionModel> data;
  const AddressSuggestionsResponseModel({required this.data});
  factory AddressSuggestionsResponseModel.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] as List<dynamic>;
    final addresses = dataList
        .map(
          (item) =>
              AddressSuggestionModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();
    return AddressSuggestionsResponseModel(data: addresses);
  }
  Map<String, dynamic> toJson() {
    return {'data': data.map((item) => item.toJson()).toList()};
  }
}
