import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/design_constants.dart';
class CustomBottomSheet {
  
  static CustomBottomSheet? _instance;
  static CustomBottomSheet get instance => _instance ??= CustomBottomSheet._initialize();

  Future<void>? displayBottomSheet({BuildContext? context, Widget? child}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(DesignConstants.instance.defaultBorderRadius),
          topLeft: Radius.circular(DesignConstants.instance.defaultBorderRadius),
        )
      ),
      context: context!,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,  
            borderRadius: BorderRadius.circular(DesignConstants.instance.defaultBorderRadius)
          ),
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        );
      },
    );
  }

  CustomBottomSheet._initialize();
}


