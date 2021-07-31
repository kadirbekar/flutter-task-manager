import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/task/controller/task_controller.dart';
import '../../enums/view_state.dart';

class BuildPlatformEnvironmentIcon extends StatelessWidget {
  const BuildPlatformEnvironmentIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (TaskController taskController) { 
        if(taskController.viewState == ViewState.Idle) {
          if(taskController.platformEnvironmentResponse.data?.isNotEmpty ?? false) {
              if(taskController.platformEnvironmentResponse.data?[0]?.type == "Dev") {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.android),
                );
            } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(Icons.flutter_dash),
                );
            }
          } else {
            return SizedBox.shrink();
          }
        } else if(taskController.viewState == ViewState.Busy) {
          return SizedBox.shrink();
        } else {
          return SizedBox.shrink();
        }
     },
    );
  }
}