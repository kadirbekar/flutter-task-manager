import 'package:get/get.dart';

import '../enums/view_state.dart';

abstract class BaseController extends GetxController {

  ViewState? viewState;

  /// This method updates view state by given new view state.
  void updateViewState(ViewState newState) {
    viewState = newState;
    update();
  }
}
