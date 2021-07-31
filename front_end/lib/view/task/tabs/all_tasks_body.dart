import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/image_constants.dart';
import '../../../core/enums/view_state.dart';
import '../../../core/reusable_widgets/cards/custom_task_card.dart';
import '../../../core/reusable_widgets/general_purpose_widgets/circular_progress_bar.dart';
import '../../../core/reusable_widgets/general_purpose_widgets/empty_body_message_widget.dart';
import '../../../core/reusable_widgets/texts/error_text.dart';
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
        child: GetBuilder<TaskController>(
          init: TaskController(),
          builder: (taskController) {
            if (taskController.viewState == ViewState.Initial) {
              return SizedBox.shrink();
            } else if (taskController.viewState == ViewState.Busy) {
              return CustomCircularProgressBar();
            } else if (taskController.viewState == ViewState.Idle) {
              return _taskController.allTasks.data?.length != 0 ? ListView.builder(
                itemBuilder: (context, index) {
                  return CustomTaskCard(
                    key: ValueKey(_taskController.allTasks.data![index].id),
                    task: _taskController.allTasks.data![index],
                  );
                },
                itemCount: _taskController.allTasks.data?.length,
              ) : _emptyBodyMessageWidget;
            } else if (taskController.viewState == ViewState.Error) {
              return const CustomErrorText();
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}


