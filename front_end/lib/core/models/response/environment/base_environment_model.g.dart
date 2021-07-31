// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformEnvironmentResponseModel _$PlatformEnvironmentResponseModelFromJson(
    Map<String, dynamic> json) {
  return PlatformEnvironmentResponseModel(
    code: json['code'] as int?,
    isOk: json['isOk'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Environment.fromMap(e as Map<String, dynamic>))
        .toList(),
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$PlatformEnvironmentResponseModelToJson(
        PlatformEnvironmentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isOk': instance.isOk,
      'data': instance.data,
      'error': instance.error,
    };
