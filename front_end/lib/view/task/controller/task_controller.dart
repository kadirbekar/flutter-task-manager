import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/common_methods/display_snackbar.dart';
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

  RxBool isStateBusy = false.obs;

  Rx<TaskResponseModel> _allTasks = TaskResponseModel().obs;
  Rx<TaskResponseModel> get allTasks => _allTasks;
  
  Rx<TaskResponseModel> _completedTasks = TaskResponseModel().obs;
  Rx<TaskResponseModel> get completedTasks => _completedTasks;

  Rx<PlatformEnvironmentResponseModel> _platformEnvironmentResponse = PlatformEnvironmentResponseModel().obs;
  Rx<PlatformEnvironmentResponseModel> get platformEnvironmentResponse => _platformEnvironmentResponse;

  Rx<UpdateTaskResponseModel> _updatedTaskResponseModel = UpdateTaskResponseModel().obs;
  Rx<UpdateTaskResponseModel> get updatedTaskResponseModel => _updatedTaskResponseModel;

  Rx<TaskResponseModel> _deletedTaskResponse = TaskResponseModel().obs;
  Rx<TaskResponseModel> get deletedTaskResponse => _deletedTaskResponse;

  Rx<AddedTaskResponseModel> _addedTaskResponse = AddedTaskResponseModel().obs;
  Rx<AddedTaskResponseModel> get addedTaskResponse => _addedTaskResponse;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formkey;

  late final TextEditingController _titleController;
  TextEditingController get titleController => _titleController;

  late final TextEditingController _contentController;
  TextEditingController get contentController => _contentController;

  late Task _willBeUpdatedTask;
  Task get willBeUpdatedTask => _willBeUpdatedTask;

  Rx<CreateTaskRequestModel> _willBeAddedTask = CreateTaskRequestModel().obs;
  Rx<CreateTaskRequestModel> get willBeAddedTask => _willBeAddedTask;

  final int _elementNotFoundIndex = -1;

  @override
  void onInit() {
    super.onInit();
    fetchAllTasks();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _willBeUpdatedTask = Task();
  }

  @override
  void onClose() {
    titleController.dispose();
    contentController.dispose();
    super.onClose();
  }

  @override
  removeTheTaskFromLocalList(Task task) {
    _allTasks.value.data?.removeWhere((element) => element.id == task.id);
    if(task.status == "Done") _completedTasks.value.data?.removeWhere((element) => element.id == task.id);
    CustomSnackbar.instance.displaySnackbar(message: "Task deleted successfully.");
  }

  @override
  updateTheTaskFromLocalList(Task task) {
    final _taskIndexInAllTasks = _allTasks.value.data?.indexWhere((element) => element.id == task.id);
    final _taskIndexInCompletedTasks = _completedTasks.value.data?.indexWhere((element) => element.id == task.id);

    _allTasks.value.data?[_taskIndexInAllTasks!] = task;

    if(_taskIndexInCompletedTasks == _elementNotFoundIndex && task.status == "Done") {
      _completedTasks.value.data?.add(task);
    } else if(_taskIndexInCompletedTasks != _elementNotFoundIndex && task.status == "Done") {
      _completedTasks.value.data?[_taskIndexInCompletedTasks!] = task;
    }
    CustomSnackbar.instance.displaySnackbar(message: "Task updated successfully.");
  }

  @override
  addNewTaskToLocalList(Task task) {
    _allTasks.value.data?.add(task);
    if(task.status == "Done") _completedTasks.value.data?.add(task);
    CustomSnackbar.instance.displaySnackbar(message: "Task added successfully.");
  }

   @override
  fillCompletedTasksOnLocal() {
    _completedTasks.value.data?.clear();
    _completedTasks.value.data = _allTasks.value.data?.where((element) => element.status == "Done").toList();
  }

  @override
  clearTextEditingControllerValues() {
    _titleController.clear();
    _contentController.clear();
  }

  @override
  createNewTaskModel({@required String? status}) async { 
   if(_formkey.currentState?.validate() ?? false) {
      Get.back();
      _willBeAddedTask  = CreateTaskRequestModel(
        title: titleController.text,
        content: contentController.text,
        status: status
      ).obs;
      await createTask(willBeAddedTask.value);
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
  fetchAllTasks() async {
    try {
      isStateBusy(true);
      _allTasks.value = await _taskRepository.fetchAllTasks();
      isStateBusy(false);
    } catch (e) {
      throw Exception(e);
    }
    fillCompletedTasksOnLocal();
  }

  @override
  updateTaskById(Task task) async {
    try {
      isStateBusy(true);
      _updatedTaskResponseModel.value = await _taskRepository.updateTaskById(task);
      isStateBusy(false);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  deleteTaskById(String taskId) async {
    try {
      isStateBusy(true);
      _deletedTaskResponse.value = await _taskRepository.deleteTaskById(taskId) ?? TaskResponseModel();
      isStateBusy(false);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  createTask(CreateTaskRequestModel task) async {
    try {
      isStateBusy(true);
      _addedTaskResponse.value = await _taskRepository.createTask(task) ?? AddedTaskResponseModel();
      if(_addedTaskResponse.value.data?.id != null) addNewTaskToLocalList(_addedTaskResponse.value.data!);
      isStateBusy(false);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  fetchPlatformEnvironmentData() async {
    try {
      isStateBusy(true);
      _platformEnvironmentResponse.value = await _taskRepository.fetchPlatformEnvironmentData();
      isStateBusy(false);
    } catch (e) {
      throw Exception(e);
    }
  }
}
