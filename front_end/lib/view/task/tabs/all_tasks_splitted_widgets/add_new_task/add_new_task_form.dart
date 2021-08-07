import 'package:flutter/material.dart';

import '../../../../../core/constants/design_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/mixins/form_validation.dart';
import '../../../../../core/models/request/task/create_task_model.dart';
import '../../../../../core/reusable_widgets/buttons/custom_text_button.dart';
import '../../../../../core/reusable_widgets/form_input/custom_text_form_field.dart';
import '../../../controller/task_controller.dart';

class AddNewTaskFrom extends StatefulWidget {

   const AddNewTaskFrom({
    Key? key,
    required TaskController taskController,
  }) : _taskController = taskController, super(key: key);

  final TaskController _taskController;

  @override
  _AddNewTaskFromState createState() => _AddNewTaskFromState();
}

class _AddNewTaskFromState extends State<AddNewTaskFrom> with FormValidation {

  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._taskController.formkey,
      autovalidateMode: _autovalidateMode,
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
                    onPressed: () async => await _createAddNewTaskModel(status: "ToDo", context: context),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "InProgress",
                    buttonBackgroundColor: DesignConstants.instance.inProgressTaskColor,
                    onPressed: () async => await _createAddNewTaskModel(status: "InProgress", context: context),
                  ),
                ),
                Expanded(
                  child: CustomTextButton(
                    buttonText: "Done",
                    buttonBackgroundColor: DesignConstants.instance.doneTaskColor,
                    onPressed: () async => await _createAddNewTaskModel(status: "Done", context: context),
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
  
  Future<void> _createAddNewTaskModel({String? status, BuildContext? context}) async {
    if(widget._taskController.formkey.currentState?.validate() ?? false) {
      Navigator.of(context!).pop();
      widget._taskController.willBeAddedTask = CreateTaskRequestModel(
        title: widget._taskController.titleController.text,
        content: widget._taskController.contentController.text,
        status: status
      );
      widget._taskController.clearTextEditingControllerValues();
      await widget._taskController.createTask(widget._taskController.willBeAddedTask);
    }
  }
}