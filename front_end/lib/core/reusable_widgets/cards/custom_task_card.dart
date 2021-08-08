import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nodejs_task_manager/view/task/controller/task_controller.dart';

import '../../../view/task/tabs/all_tasks_splitted_widgets/task_card_body.dart';
import '../../../view/task/tabs/all_tasks_splitted_widgets/task_card_footer.dart';
import '../../../view/task/tabs/all_tasks_splitted_widgets/update_task/task_update_body.dart';
import '../../common_methods/display_bottom_sheet.dart';
import '../../constants/design_constants.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/string_extension.dart';
import '../../models/response/base_model/task_model.dart';
import '../texts/title_text.dart';

class CustomTaskCard extends StatelessWidget {
  final Task? task;

  const CustomTaskCard({
    Key? key,
    @required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskController _taskController = Get.find();

    final _titleOfTheTask = Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: TitleText(
          text: task?.title,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.left,
        ),
      ),
    );

    return Obx((){
      if(!_taskController.isStateBusy.value) {
        return GestureDetector(
          onTap: () => CustomBottomSheet.instance.displayBottomSheet(context: context, child: UpdateTaskBottomSheetBody(task: task!)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: DesignConstants.instance.borderRadiusCircular,
              ),
              elevation: 4,
              child: ClipRRect(
                borderRadius: DesignConstants.instance.borderRadiusCircular,
                child: Card(
                    color: TaskCardBackGroundColor.value(task?.status ?? "ToDo"),
                    child: Column(
                      children: [
                        _titleOfTheTask,
                        context.lowHeightSpace,
                        TaskCardBody(task: task),
                        context.lowHeightSpace,
                        TaskCardFooter(task: task)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
