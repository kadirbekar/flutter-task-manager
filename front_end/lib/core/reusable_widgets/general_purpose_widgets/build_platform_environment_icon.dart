import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/task/controller/task_controller.dart';

class BuildPlatformEnvironmentIcon extends StatelessWidget {
  const BuildPlatformEnvironmentIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController _taskController = Get.find();
    return Obx(() {
      if (_taskController.platformEnvironmentResponse.value.data?.isNotEmpty ?? false) {
        if (_taskController.platformEnvironmentResponse.value.data?[0]?.type == "Dev") {
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
    });
  }
}
