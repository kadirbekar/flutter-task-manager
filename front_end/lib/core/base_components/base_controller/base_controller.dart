import 'package:get/get.dart';

import '../../enums/view_state.dart';
import '../../models/response/base_model/task_model.dart';
abstract class IBaseController extends GetxController {

  ViewState? viewState;

  void updateViewState(ViewState newState) {
    viewState = newState;
    update();
  }

  ///  This method deletes the given task object on local list
  removeTheTaskFromLocalList(Task task);

  /// This method updates the given task object on local list
  updateTheTaskFromLocalList(Task task);

  /// This method adds the given task object to local list
  addNewTaskToLocalList(Task task);

  /// This method updates completed task list on local
  fillCompletedTasksOnLocal();
}
