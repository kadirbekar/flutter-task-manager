import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/models/response/base_model/task_model.dart';
import '../../../../../core/reusable_widgets/texts/title_text.dart';
import '../../../controller/task_controller.dart';
import 'task_update_form.dart';

class UpdateTaskBottomSheetBody extends StatefulWidget {
  final Task task;
  const UpdateTaskBottomSheetBody({
    Key? key,
    required this.task,
  }) : super(key: key);


  @override
  _UpdateTaskBottomSheetBodyState createState() => _UpdateTaskBottomSheetBodyState();
}
class _UpdateTaskBottomSheetBodyState extends State<UpdateTaskBottomSheetBody> {

  final TaskController _taskController = Get.find();

  @override
  void initState() {
    super.initState();
    _taskController.titleController.text = widget.task.title!;
    _taskController.contentController.text = widget.task.content!;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(
              text: "Current Status : ${widget.task.status}", 
              fontWeight: FontWeight.w600,
              textColor: Colors.black,
            ),
            context.mediumHeightSpace,
            TaskUpdateForm(taskController: _taskController, task: widget.task,),
          ],
        ),
      ),
    );
  }
}

