import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/design_constants.dart';
import '../reusable_widgets/texts/title_text.dart';
class CustomSnackbar {
  
  static CustomSnackbar? _instance;
  static CustomSnackbar get instance => _instance ??= CustomSnackbar._initialize();

  Future<void>? displaySnackbar({String? message}) {
    return Get.showSnackbar(GetBar(
      icon: Icon(Icons.done_all, color: Colors.white),
      duration: const Duration(milliseconds: 2100),
      borderRadius: DesignConstants.instance.defaultBorderRadius,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.teal,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: const EdgeInsets.all(12),
      messageText: TitleText(text: "$message", fontSize: 20, textColor: Colors.white,)),
    );
  }

  CustomSnackbar._initialize();
}


