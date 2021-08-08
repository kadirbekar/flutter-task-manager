import 'package:flutter/material.dart';

class BaseIcons {

  static BaseIcons? _instance;
  static BaseIcons get instance => _instance ??= BaseIcons._initialize();

  final IconData add = Icons.add;

  BaseIcons._initialize();
}