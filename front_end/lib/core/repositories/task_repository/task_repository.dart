import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

import '../../initialize/network/network_settings.dart';
import '../../models/request/task/create_task_model.dart';
import '../../models/response/base_model/base_task_model.dart';
import '../../models/response/base_model/task_model.dart';
import '../../models/response/environment/base_environment_model.dart';
import '../../models/response/task/added_task/added_task_model.dart';
import '../../models/response/task/updated_task/update_task_model.dart';
import 'ITaskRepository.dart';
class TaskRepository with ITaskRepository {

  late final INetworkManager _networkManager;

  TaskRepository() {
    _networkManager = NetworkSettings.instance.manager;
  }

  final String _taskRequestPath = "task";
  final String _fetchAllTasksPath = "fetchAllTasks";
  final String _updateTaskByIdPath = "updateTaskById";
  final String _deleteTaskByIdPath = "deleteTaskById";
  final String _createTaskPath = "createTask";
  final String _fetchPlatformEnvironmentPath = "fetchPlatformEnvironment";

  @override
  Future<TaskResponseModel> fetchAllTasks() async {
    final _allTasksResponse = await _networkManager.send<TaskResponseModel,TaskResponseModel>(
      "/$_taskRequestPath/$_fetchAllTasksPath", 
      parseModel: TaskResponseModel(), 
      method: RequestType.GET,
    );
    return _allTasksResponse.data!;
  }

  @override
  Future<UpdateTaskResponseModel> updateTaskById(Task task) async {
    final _updatedTaskResponse = await _networkManager.send<UpdateTaskResponseModel, UpdateTaskResponseModel>(
      "/$_taskRequestPath/$_updateTaskByIdPath/${task.id}",
      parseModel: UpdateTaskResponseModel(),
      method: RequestType.POST,
      data: task.toMap()
    );

    return _updatedTaskResponse.data ?? UpdateTaskResponseModel();
  }

  @override
  Future<TaskResponseModel?> deleteTaskById(String taskId) async {
    final _deletedTaskResponse = await _networkManager.send<TaskResponseModel, TaskResponseModel>(
      "/$_taskRequestPath/$_deleteTaskByIdPath/$taskId", 
      parseModel: TaskResponseModel(), 
      method: RequestType.POST,
    );

    return _deletedTaskResponse.data ?? TaskResponseModel();
  }

  @override
  Future<AddedTaskResponseModel?> createTask(CreateTaskRequestModel task) async {
    final _addedTaskResponse = await _networkManager.send<AddedTaskResponseModel, AddedTaskResponseModel>(
      "/$_taskRequestPath/$_createTaskPath", 
      parseModel: AddedTaskResponseModel(), 
      method: RequestType.POST,
      data: task.toMap()
    );

    return _addedTaskResponse.data;
  }

  @override
  Future<PlatformEnvironmentResponseModel> fetchPlatformEnvironmentData() async {
    final _platformEnvironmentResponse = await _networkManager.send<PlatformEnvironmentResponseModel, PlatformEnvironmentResponseModel>(
      "/$_taskRequestPath/$_fetchPlatformEnvironmentPath",
      parseModel: PlatformEnvironmentResponseModel(), 
      method: RequestType.GET,
    );

    return _platformEnvironmentResponse.data!;
  }
}