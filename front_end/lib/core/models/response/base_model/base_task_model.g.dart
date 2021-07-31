// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponseModel _$TaskResponseModelFromJson(Map<String, dynamic> json) {
  return TaskResponseModel(
    code: json['code'] as int?,
    isOk: json['isOk'] as bool?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Task.fromMap(e as Map<String, dynamic>))
        .toList(),
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$TaskResponseModelToJson(TaskResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isOk': instance.isOk,
      'data': instance.data,
      'error': instance.error,
    };
