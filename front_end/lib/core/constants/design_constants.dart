import 'package:flutter/material.dart';
class DesignConstants {
  
  static DesignConstants? _instance;
  static DesignConstants get instance => _instance ??= DesignConstants._initialize();

  static final double _defaultBorderRadius = 10.0;
  double get defaultBorderRadius => _defaultBorderRadius;

  final BorderRadius _borderRadiusCircular = BorderRadius.circular(_defaultBorderRadius);
  BorderRadius get borderRadiusCircular => _borderRadiusCircular;

  final Color toDoTaskColor = Colors.blue;
  final Color inProgressTaskColor = Colors.teal;
  final Color doneTaskColor = Colors.deepOrange;

  DesignConstants._initialize();
}
