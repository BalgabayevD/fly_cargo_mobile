part of 'file_upload_models.dart';





FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) =>
    FileUploadResponse(data: json['data'] as String);

Map<String, dynamic> _$FileUploadResponseToJson(FileUploadResponse instance) =>
    <String, dynamic>{'data': instance.data};

FileUploadError _$FileUploadErrorFromJson(Map<String, dynamic> json) =>
    FileUploadError(error: json['error'] as String);

Map<String, dynamic> _$FileUploadErrorToJson(FileUploadError instance) =>
    <String, dynamic>{'error': instance.error};
