import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/models/response/base_model/task_model.dart';
import '../../../../core/reusable_widgets/buttons/custom_text_button.dart';
import '../../../../core/reusable_widgets/texts/content_text.dart';
import '../../controller/task_controller.dart';

class TaskCardFooter extends StatelessWidget {
  final Task? task;
  const TaskCardFooter({Key? key, @required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController _taskController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PageSpecificText(text: "Date : ${Jiffy(task?.processDate).format("do yyyy, hh:mm")}"),
              _PageSpecificText(text: "Status : ${task?.status}")
            ],
          ),
          if(task?.status == "Done") ...{
            context.lowHeightSpace,
            CustomTextButton(
              edgeInsets: const EdgeInsets.all(0),
              buttonText: "Delete Task",
              textColor: Colors.black,
              buttonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)
              ),
              onPressed: () async {
                _taskController.removeTheTaskFromLocalList(task!);
                _taskController.titleController.clear();
                _taskController.contentController.clear();
                await _taskController.deleteTaskById("${task?.id}");
              }
            )
          }
        ],
      ),
    );
  }
}

class _PageSpecificText extends StatelessWidget {

  final String? text;

  const _PageSpecificText({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentText(
      text: text,
      fontWeight: FontWeight.w600,
      textColor: Colors.white,
    );
  }
}
