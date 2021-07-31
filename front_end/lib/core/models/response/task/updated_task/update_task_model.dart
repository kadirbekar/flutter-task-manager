import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'update_task_model.g.dart';

@JsonSerializable()
class UpdateTaskResponseModel extends INetworkModel<UpdateTaskResponseModel> {

  final String? id;
  final String? title;
  final String? content;
  final String? status;
  final String? processDate;

  UpdateTaskResponseModel({
    this.id,
    this.title,
    this.content,
    this.status,
    this.processDate,
  });

  factory UpdateTaskResponseModel.fromMap(Map<String, dynamic> json) => _$UpdateTaskResponseModelFromJson(json);

  Map<String, dynamic> toMap() => _$UpdateTaskResponseModelToJson(this);

  @override
  UpdateTaskResponseModel fromJson(Map<String, dynamic> json) => UpdateTaskResponseModel.fromMap(json);

  @override
  Map<String, dynamic> toJson() => toMap();
}
