import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {

  @required final Function()? onPressed;
  final IconData? iconData;
  final Color? color;
  final double? size;

  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
    this.iconData,
    this.color,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: color ?? Colors.white,
        size: size ?? 35,
      ),
    );
  }
}