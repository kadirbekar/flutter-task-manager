import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/reusable_widgets/buttons/close_dialog_button.dart';
import '../../../../../core/reusable_widgets/texts/title_text.dart';
import '../../../controller/task_controller.dart';
import 'add_new_task_form.dart';

class AddNewTaskBody extends StatelessWidget {
  const AddNewTaskBody({
    Key? key,
    required TaskController taskController,
  })  : _taskController = taskController,
        super(key: key);

  final TaskController _taskController;

  @override
  Widget build(BuildContext context) {

    final _addNewTaskTitle = TitleText(
      text: "Add New Task",
      fontWeight: FontWeight.w600,
      textColor: Colors.black,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _addNewTaskTitle,
            context.mediumHeightSpace,
            AddNewTaskFrom(taskController: _taskController),
            context.lowHeightSpace,
            const CloseDialogButton()
          ],
        ),
      ),
    );
  }
}
