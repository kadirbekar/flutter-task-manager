import 'package:flutter/material.dart';

import '../../../core/base_controller/base_getx_controller.dart';
import '../../../core/models/response/base_model/task_model.dart';

abstract class BaseTaskController extends BaseController {
  ///  This method deletes the given task object on local list
  removeTheTaskFromLocalList(Task task);

  /// This method updates the given task object on local list
  updateTheTaskFromLocalList(Task task);

  /// This method adds the given task object to local list
  addNewTaskToLocalList(Task task);

  /// This method updates completed task list on local
  fillCompletedTasksOnLocal();

  //  This method clears text editing controller values.
  clearTextEditingControllerValues();

  /// This method checks if the form is validated or not, if validated, it creates a new task on database.
  createNewTaskModel({@required String? status});

  /// This method checks if the form is validated or not, if validated, it updates the current task by task id
  createUpdateTaskModel({@required String? taskId, @required String? status});
}