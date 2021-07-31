import 'package:flutter/material.dart';

import '../../../../../core/constants/design_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/models/request/task/create_task_model.dart';
import '../../../../../core/reusable_widgets/buttons/close_dialog_button.dart';
import '../../../../../core/reusable_widgets/buttons/custom_text_button.dart';
import '../../../../../core/reusable_widgets/texts/title_text.dart';
import '../../../controller/task_controller.dart';
import 'add_new_task_form.dart';

class AddNewTaskBody extends StatelessWidget {
  const AddNewTaskBody({
    Key? key,
    required TaskController taskController,
  }) : _taskController = taskController, super(key: key);

  final TaskController _taskController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText(text: "Add New Task", fontWeight: FontWeight.w600, textColor: Colors.black,),
            context.mediumHeightSpace,
            AddNewTaskFrom(taskController: _taskController),
            context.lowHeightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextButton(
                    buttonText: "ToDo",
                    buttonBackgroundColor: DesignConstants.instance.toDoTaskColor,
                    onPressed: () => _createAddNewTaskModel(status: "ToDo", context: context),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "InProgress",
                    buttonBackgroundColor: DesignConstants.instance.inProgressTaskColor,
                    onPressed: () => _createAddNewTaskModel(status: "InProgress", context: context),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "Done",
                    buttonBackgroundColor: DesignConstants.instance.doneTaskColor,
                    onPressed: () => _createAddNewTaskModel(status: "Done", context: context),
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

  Future<void> _createAddNewTaskModel({String? status, BuildContext? context}) async {
    Navigator.of(context!).pop();
    _taskController.willBeAddedTask = CreateTaskRequestModel(
      title: _taskController.titleController.text,
      content: _taskController.contentController.text,
      status: status
    );
    _taskController.titleController.clear();
    _taskController.contentController.clear();
    await _taskController.createTask(_taskController.willBeAddedTask);
  }
}