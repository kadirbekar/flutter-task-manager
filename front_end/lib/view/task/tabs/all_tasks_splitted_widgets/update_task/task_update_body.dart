import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/design_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/models/response/base_model/task_model.dart';
import '../../../../../core/reusable_widgets/buttons/close_dialog_button.dart';
import '../../../../../core/reusable_widgets/buttons/custom_text_button.dart';
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
            TaskUpdateForm(taskController: _taskController),
            context.lowHeightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextButton(
                    buttonText: "ToDo",
                    buttonBackgroundColor: DesignConstants.instance.toDoTaskColor,
                    onPressed: () => _createUpdateTaskModel(taskStatus: "ToDo"),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "InProgress",
                    buttonBackgroundColor: DesignConstants.instance.inProgressTaskColor,
                    onPressed: () => _createUpdateTaskModel(taskStatus: "InProgress"),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "Done",
                    buttonBackgroundColor: DesignConstants.instance.doneTaskColor,
                    onPressed: () => _createUpdateTaskModel(taskStatus: "Done"),
                  ),
                )
              ],
            ),
            context.lowHeightSpace,
            const CloseDialogButton()
          ],
        ),
      ),
    );
  }

  Future<void> _createUpdateTaskModel({String? taskStatus}) async {
    Navigator.of(context).pop();
    _taskController.willBeUpdatedTask = Task(
      id: widget.task.id,
      title: _taskController.titleController.text,
      content: _taskController.contentController.text,
      processDate: DateTime.now().toString(),
      status: taskStatus
    );
    _taskController.titleController.clear();
    _taskController.contentController.clear();
    _taskController.updateTheTaskFromLocalList(_taskController.willBeUpdatedTask);
    await _taskController.updateTaskById(_taskController.willBeUpdatedTask);
  }
}

