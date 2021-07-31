// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Environment _$EnvironmentFromJson(Map<String, dynamic> json) {
  return Environment(
    id: json['_id'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$EnvironmentToJson(Environment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
