import 'package:get_it/get_it.dart';

import 'core/repositories/task_repository/task_repository.dart';

GetIt locator = GetIt.instance;

Future<void>? setupLocator() {
  locator.registerLazySingleton<TaskRepository>(() => TaskRepository());
}