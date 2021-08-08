import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/reusable_widgets/cards/custom_task_card.dart';
import '../../../core/reusable_widgets/general_purpose_widgets/circular_progress_bar.dart';
import '../../../core/reusable_widgets/general_purpose_widgets/empty_body_message_widget.dart';
import '../controller/task_controller.dart';

class AllTasksBody extends StatelessWidget {
  const AllTasksBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    late final TaskController _taskController = Get.find();

    final _emptyBodyMessageWidget = EmptyBodyMessageWidget(
      imagePath: ImageConstants.instance.emptyData, 
      message: "You did not add any task to the list.",
    );

    return Scaffold(
      body: Container(
        color: Colors.blueGrey.withOpacity(.1),
        child: Obx(() {
          if(_taskController.isStateBusy.value) {
            return const CustomCircularProgressBar();
          } else if(_taskController.allTasks.value.data?.length != 0) {
            return ListView.builder(
                itemCount: _taskController.allTasks.value.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomTaskCard(
                    key: ValueKey(_taskController.allTasks.value.data![index].id),
                    task: _taskController.allTasks.value.data![index],
                  );
                }
              );
          } else if(_taskController.allTasks.value.data?.length == 0) {
            return _emptyBodyMessageWidget;
          }
          else {
            return SizedBox.shrink();
          }
        }),
      ),
    );
  }
}


