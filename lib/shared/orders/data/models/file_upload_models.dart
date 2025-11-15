import 'package:json_annotation/json_annotation.dart';
part 'file_upload_models.g.dart';
@JsonSerializable()
class FileUploadResponse {
  final String data;
  const FileUploadResponse({required this.data});
  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FileUploadResponseToJson(this);
}
@JsonSerializable()
class FileUploadError {
  final String error;
  const FileUploadError({required this.error});
  factory FileUploadError.fromJson(Map<String, dynamic> json) =>
      _$FileUploadErrorFromJson(json);
  Map<String, dynamic> toJson() => _$FileUploadErrorToJson(this);
}
