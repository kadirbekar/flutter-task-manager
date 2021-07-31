import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class Task {

    final String? id;
    final String? title;
    final String? content;
    final String? status;
    final String? processDate;

    Task({
        this.id,
        this.title,
        this.content,
        this.status,
        this.processDate,
    });

    factory Task.fromMap(Map<String, dynamic> json) => _$TaskFromJson(json);

    Map<String, dynamic> toMap() => _$TaskToJson(this);
}