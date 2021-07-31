import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

import '../../base_model/task_model.dart';

part 'added_task_model.g.dart';

@JsonSerializable()
class AddedTaskResponseModel extends INetworkModel<AddedTaskResponseModel> {

    final int? code;
    final bool? isOk;
    final Task? data;
    final String? error;

    AddedTaskResponseModel({
        this.code,
        this.isOk,
        this.data,
        this.error,
    });

    factory AddedTaskResponseModel.fromMap(Map<String, dynamic> json) => _$AddedTaskResponseModelFromJson(json);

    Map<String, dynamic> toMap() => _$AddedTaskResponseModelToJson(this);

    @override
    AddedTaskResponseModel fromJson(Map<String, dynamic> json) => AddedTaskResponseModel.fromMap(json);

    @override
    Map<String, dynamic> toJson() => toMap();
}
