import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/extensions/string_extension.dart';
import '../../../../core/models/response/base_model/task_model.dart';
import '../../../../core/reusable_widgets/texts/content_text.dart';
import '../../controller/task_controller.dart';
class TaskCardBody extends StatelessWidget {
  const TaskCardBody({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TaskController(),
      builder: (TaskController taskController) {
        final _taskItem = taskController.allTasks.data?.firstWhere((element) => element.id == task?.id);
        return Card(
          color: TaskCardBackGroundColor.value(_taskItem?.status ?? "ToDo"),
          elevation: 0,
          margin: const EdgeInsets.all(12),
          child: ContentText(
            text: _taskItem?.content,
            fontSize: 17,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}
