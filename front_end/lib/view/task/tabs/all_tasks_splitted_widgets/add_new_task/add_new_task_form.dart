import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/reusable_widgets/form_input/custom_text_form_field.dart';
import '../../../controller/task_controller.dart';

class AddNewTaskFrom extends StatelessWidget {
  const AddNewTaskFrom({
    Key? key,
    required TaskController taskController,
  }) : _taskController = taskController, super(key: key);

  final TaskController _taskController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _taskController.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _taskController.titleController,
            hintText: "Title",
            textInputAction: TextInputAction.next,
          ),
          context.lowHeightSpace,
          CustomTextFormField(
            controller: _taskController.contentController,
            hintText: "Content",
            maxLine: 3,
          ),
        ],
      ),
    );
  }
}