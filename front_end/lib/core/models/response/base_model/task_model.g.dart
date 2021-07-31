// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    content: json['content'] as String?,
    status: json['status'] as String?,
    processDate: json['processDate'] as String?,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
      'processDate': instance.processDate,
    };
