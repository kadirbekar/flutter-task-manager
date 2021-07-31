// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedTaskResponseModel _$AddedTaskResponseModelFromJson(
    Map<String, dynamic> json) {
  return AddedTaskResponseModel(
    code: json['code'] as int?,
    isOk: json['isOk'] as bool?,
    data: json['data'] == null
        ? null
        : Task.fromMap(json['data'] as Map<String, dynamic>),
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$AddedTaskResponseModelToJson(
        AddedTaskResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'isOk': instance.isOk,
      'data': instance.data,
      'error': instance.error,
    };
