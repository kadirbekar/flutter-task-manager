import '../../models/request/task/create_task_model.dart';
import '../../models/response/base_model/task_model.dart';

mixin BaseTaskRepository {
  /// This method returns all tasks from database as TaskResponseModel
  fetchAllTasks();

  /// This method creates a new record on database
  createTask(CreateTaskRequestModel task);

  /// This method updates the record on database with the given task id
  updateTaskById(Task task);

  /// This method deletes the record on database with the given task id
  deleteTaskById(String taskId);

  /// This method returns platforn environment variable that our applicaton use
  fetchPlatformEnvironmentData();
}