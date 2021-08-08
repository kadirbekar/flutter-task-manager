import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common_methods/display_snackbar.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/models/request/task/create_task_model.dart';
import '../../../core/models/response/base_model/base_task_model.dart';
import '../../../core/models/response/base_model/task_model.dart';
import '../../../core/models/response/environment/base_environment_model.dart';
import '../../../core/models/response/task/added_task/added_task_model.dart';
import '../../../core/models/response/task/updated_task/update_task_model.dart';
import '../../../core/repositories/task_repository/base_task_repository.dart';
import '../../../core/repositories/task_repository/task_repository.dart';
import '../../../locator.dart';
import 'base_task_controller.dart';
class TaskController extends BaseTaskController with BaseTaskRepository {

  final TaskRepository _taskRepository = locator.get<TaskRepository>();

  TaskResponseModel _allTasks = TaskResponseModel();
  TaskResponseModel get allTasks => _allTasks;
  
  late TaskResponseModel _completedTasks;
  TaskResponseModel get completedTasks => _completedTasks;

  late PlatformEnvironmentResponseModel _platformEnvironmentResponse;
  PlatformEnvironmentResponseModel get platformEnvironmentResponse => _platformEnvironmentResponse;

  late UpdateTaskResponseModel _updatedTaskResponseModel;
  UpdateTaskResponseModel get updatedTaskResponseModel => _updatedTaskResponseModel;

  late TaskResponseModel _deletedTaskResponse;
  TaskResponseModel get deletedTaskResponse => _deletedTaskResponse;

  late AddedTaskResponseModel _addedTaskResponse;
  AddedTaskResponseModel get addedTaskResponse => _addedTaskResponse;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formkey;

  late final TextEditingController _titleController;
  TextEditingController get titleController => _titleController;

  late final TextEditingController _contentController;
  TextEditingController get contentController => _contentController;

  late Task _willBeUpdatedTask;
  Task get willBeUpdatedTask => _willBeUpdatedTask;

  late CreateTaskRequestModel _willBeAddedTask;
  CreateTaskRequestModel get willBeAddedTask => _willBeAddedTask;

  final int _elementNotFoundIndex = -1;

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks();
    _platformEnvironmentResponse = PlatformEnvironmentResponseModel();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _updatedTaskResponseModel = UpdateTaskResponseModel();
    _deletedTaskResponse = TaskResponseModel();
    _willBeUpdatedTask = Task();
    _willBeAddedTask = CreateTaskRequestModel();
    _completedTasks = TaskResponseModel();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  @override
  removeTheTaskFromLocalList(Task task) {
    _allTasks.data?.removeWhere((element) => element.id == task.id);
    if(task.status == "Done") _completedTasks.data?.removeWhere((element) => element.id == task.id);
    update();
    CustomSnackbar.instance.displaySnackbar(message: "Task deleted successfully.");
  }

  @override
  updateTheTaskFromLocalList(Task task) {
    final _taskIndexInAllTasks = _allTasks.data?.indexWhere((element) => element.id == task.id);
    final _taskIndexInCompletedTasks = _completedTasks.data?.indexWhere((element) => element.id == task.id);

    _allTasks.data?[_taskIndexInAllTasks!] = task;

    if(_taskIndexInCompletedTasks == _elementNotFoundIndex && task.status == "Done") {
      _completedTasks.data?.add(task);
    } else if(_taskIndexInCompletedTasks != _elementNotFoundIndex && task.status == "Done") {
      _completedTasks.data?[_taskIndexInCompletedTasks!] = task;
    }

    update();
    CustomSnackbar.instance.displaySnackbar(message: "Task updated successfully.");
  }

  @override
  addNewTaskToLocalList(Task task) {
    _allTasks.data?.add(task);
    if(task.status == "Done") _completedTasks.data?.add(task);
    update();
    CustomSnackbar.instance.displaySnackbar(message: "Task added successfully.");
  }

   @override
  fillCompletedTasksOnLocal() {
    _completedTasks.data?.clear();
    _completedTasks.data = _allTasks.data?.where((element) => element.status == "Done").toList();
  }

  @override
  clearTextEditingControllerValues() {
    titleController.clear();
    contentController.clear();
  }

  @override
  createNewTaskModel({@required String? status}) async { 
   if(_formkey.currentState?.validate() ?? false) {
      Get.back();
      _willBeAddedTask  = CreateTaskRequestModel(
        title: titleController.text,
        content: contentController.text,
        status: status
      );
      await createTask(willBeAddedTask);
      clearTextEditingControllerValues();
    }
  }
  
  @override
  createUpdateTaskModel({@required String? taskId, @required String? status}) async {
    if(_formkey.currentState?.validate() ?? false) {
      Get.back();
      _willBeUpdatedTask = Task(
        id: taskId!,
        title: titleController.text,
        content: contentController.text,
        processDate: DateTime.now().toString(),
        status: status
      );
      clearTextEditingControllerValues();
      updateTheTaskFromLocalList(willBeUpdatedTask);
      await updateTaskById(willBeUpdatedTask);
    }
  }

  @override
  Future<TaskResponseModel> fetchAllTasks() async {
    try {
      _allTasks = TaskResponseModel();
      updateViewState(ViewState.Busy);
      _allTasks = await _taskRepository.fetchAllTasks();
      updateViewState(ViewState.Idle);
    } catch (e) {
      updateViewState(ViewState.Error);
      throw Exception(e);
    }
    fillCompletedTasksOnLocal();
    return _allTasks;
  }

  @override
  Future<UpdateTaskResponseModel> updateTaskById(Task task) async {
    try {
      _updatedTaskResponseModel = await _taskRepository.updateTaskById(task);
    } catch (e) {
      updateViewState(ViewState.Error);
      throw Exception(e);
    }
    return _updatedTaskResponseModel;
  }

  @override
  Future<TaskResponseModel?> deleteTaskById(String taskId) async {
    try {
      _deletedTaskResponse = await _taskRepository.deleteTaskById(taskId) ?? TaskResponseModel();
    } catch (e) {
      updateViewState(ViewState.Error);
      throw Exception(e);
    }
    return _deletedTaskResponse;
  }

  @override
  Future<AddedTaskResponseModel?> createTask(CreateTaskRequestModel task) async {
    try {
      _addedTaskResponse = await _taskRepository.createTask(task) ?? AddedTaskResponseModel();
      if(_addedTaskResponse.data?.id != null) addNewTaskToLocalList(_addedTaskResponse.data!);
    } catch (e) {
      updateViewState(ViewState.Error);
      throw Exception(e);
    }
    return _addedTaskResponse;
  }

  @override
  Future<PlatformEnvironmentResponseModel> fetchPlatformEnvironmentData() async {
    try {
      updateViewState(ViewState.Busy);
      _platformEnvironmentResponse = await _taskRepository.fetchPlatformEnvironmentData();
      updateViewState(ViewState.Idle);
    } catch (e) {
      updateViewState(ViewState.Error);
      throw Exception(e);
    }
    return _platformEnvironmentResponse;
  }
}
