// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTaskResponseModel _$UpdateTaskResponseModelFromJson(
    Map<String, dynamic> json) {
  return UpdateTaskResponseModel(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    status: json['status'] as String?,
    processDate: json['processDate'] as String?,
  );
}

Map<String, dynamic> _$UpdateTaskResponseModelToJson(
        UpdateTaskResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'processDate': instance.processDate,
    };
