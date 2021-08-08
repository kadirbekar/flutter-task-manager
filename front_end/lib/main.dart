import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/initialize/network/network_settings.dart';
import 'locator.dart';
import 'view/task/screen/task_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  NetworkSettings.instance.initializeNetworkSettings();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const TaskManager());
}

class TaskManager extends StatelessWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const TaskPage(),
    );
  }
}
