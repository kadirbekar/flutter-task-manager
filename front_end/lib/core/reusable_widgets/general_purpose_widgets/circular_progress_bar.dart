import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Center _center = Center(child: CircularProgressIndicator());

    return _center;
  }
}
