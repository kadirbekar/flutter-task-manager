import 'package:flutter/material.dart';

import '../constants/design_constants.dart';
import '../enums/task_status.dart';

extension TaskStatusExtension on TaskStatus {
  static String? value(TaskStatus taskStatus) {
    switch (taskStatus) {
      case TaskStatus.ToDo:
        return "ToDo";
      case TaskStatus.InProgress:
        return "InProgress";
      case TaskStatus.Done:
        return "Done";
      default:
        "Wrong task status value passed.";
    }
  }
}

extension TaskCardBackGroundColor on String {
  static Color value(String taskStatus) {
    switch (taskStatus) {
      case "ToDo":
        return DesignConstants.instance.toDoTaskColor;
      case "InProgress":
        return DesignConstants.instance.inProgressTaskColor;
      case "Done":
        return DesignConstants.instance.doneTaskColor;
      default:
        return Colors.pink;
    }
  }
}