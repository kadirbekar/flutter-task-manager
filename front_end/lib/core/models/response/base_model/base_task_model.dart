import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import 'task_model.dart';

part 'base_task_model.g.dart';

@JsonSerializable()
class TaskResponseModel extends INetworkModel<TaskResponseModel> {
  
    TaskResponseModel({
        this.code,
        this.isOk,
        this.data,
        this.error,
    });

    final int? code;
    final bool? isOk;
    List<Task>? data;
    final String? error;

    factory TaskResponseModel.fromMap(Map<String, dynamic> json) => _$TaskResponseModelFromJson(json);

    Map<String, dynamic> toMap() => _$TaskResponseModelToJson(this);

    @override
    TaskResponseModel fromJson(Map<String, dynamic> json) => TaskResponseModel.fromMap(json);

    @override
    Map<String, dynamic> toJson() => toMap();
}
