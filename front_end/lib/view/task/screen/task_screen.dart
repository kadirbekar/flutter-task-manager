import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_nodejs_task_manager/core/reusable_widgets/buttons/custom_floating_action_button.dart';

import '../../../core/common_methods/display_bottom_sheet.dart';
import '../../../core/reusable_widgets/general_purpose_widgets/build_platform_environment_icon.dart';
import '../../../core/reusable_widgets/texts/tab_title.dart';
import '../../../core/reusable_widgets/texts/title_text.dart';
import '../controller/task_controller.dart';
import '../tabs/all_tasks_body.dart';
import '../tabs/all_tasks_splitted_widgets/add_new_task/add_new_task_body.dart';
import '../tabs/completed_tasks_body.dart';


class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with SingleTickerProviderStateMixin {

  late final TabController? _tabController;
  final TaskController _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _taskController.fetchPlatformEnvironmentData();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _taskController.titleController.dispose();
    _taskController.contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: Card(
        elevation: 0,
        shape: StadiumBorder(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomFloatingActionButton(
            onPressed: () => CustomBottomSheet.instance.displayBottomSheet(
              context: context,
              child: AddNewTaskBody(taskController: _taskController),
            ),
            iconData: Icons.add,
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          const BuildPlatformEnvironmentIcon(),
        ],
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: TitleText(
          text: "Tasks",
          fontSize: 22,
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            const TabTitle(title: "All"),
            const TabTitle(title: "Completed")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const AllTasksBody(),
          const CompletedTasksBody()
        ],
      ),
    );
  }
}

