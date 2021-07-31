import '../../models/request/task/create_task_model.dart';
import '../../models/response/base_model/base_task_model.dart';
import '../../models/response/base_model/task_model.dart';
import '../../models/response/environment/base_environment_model.dart';
import '../../models/response/task/added_task/added_task_model.dart';
import '../../models/response/task/updated_task/update_task_model.dart';

mixin ITaskRepository {
  /// This method returns all tasks from database as TaskResponseModel
  Future<TaskResponseModel> fetchAllTasks();

  /// This method creates a new record on database
  Future<AddedTaskResponseModel?> createTask(CreateTaskRequestModel task);

  /// This method updates the record on database with the given task id
  Future<UpdateTaskResponseModel> updateTaskById(Task task);

  /// This method deletes the record on database with the given task id
  Future<TaskResponseModel?> deleteTaskById(String taskId);

  /// This method returns platforn environment variable that our applicaton use
  Future<PlatformEnvironmentResponseModel> fetchPlatformEnvironmentData();
}