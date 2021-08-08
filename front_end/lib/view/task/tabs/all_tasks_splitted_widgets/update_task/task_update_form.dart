import 'package:flutter/material.dart';

import '../../../../../core/constants/design_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/mixins/form_validation.dart';
import '../../../../../core/models/response/base_model/task_model.dart';
import '../../../../../core/reusable_widgets/buttons/close_dialog_button.dart';
import '../../../../../core/reusable_widgets/buttons/custom_text_button.dart';
import '../../../../../core/reusable_widgets/form_input/custom_text_form_field.dart';
import '../../../controller/task_controller.dart';

class TaskUpdateForm extends StatefulWidget {
  
  final Task? task;
  const TaskUpdateForm({
    Key? key,
    required TaskController taskController,
    required this.task
  }) : _taskController = taskController, super(key: key);

  final TaskController _taskController;

  @override
  _TaskUpdateFormState createState() => _TaskUpdateFormState();
}

class _TaskUpdateFormState extends State<TaskUpdateForm> with FormValidation {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._taskController.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: widget._taskController.titleController,
            hintText: "Title",
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) => checkFormInputValue(value!),
          ),
          context.lowHeightSpace,
          CustomTextFormField(
            controller: widget._taskController.contentController,
            hintText: "Content",
            maxLine: 3,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) => checkFormInputValue(value!),
          ),
          context.lowHeightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomTextButton(
                    buttonText: "ToDo",
                    buttonBackgroundColor: DesignConstants.instance.toDoTaskColor,
                    onPressed: () async => await widget._taskController.createUpdateTaskModel(taskId: widget.task?.id, status: "ToDo"),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "InProgress",
                    buttonBackgroundColor: DesignConstants.instance.inProgressTaskColor,
                    onPressed: () async => await widget._taskController.createUpdateTaskModel(taskId: widget.task?.id, status: "InProgress"),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "Done",
                    buttonBackgroundColor: DesignConstants.instance.doneTaskColor,
                    onPressed: () async => await widget._taskController.createUpdateTaskModel(taskId: widget.task?.id, status: "Done"),
                  ),
                )
              ],
            ),
            context.lowHeightSpace,
            const CloseDialogButton()
        ],
      ),
    );
  }
}