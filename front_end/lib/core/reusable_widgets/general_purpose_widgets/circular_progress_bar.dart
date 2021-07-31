import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
