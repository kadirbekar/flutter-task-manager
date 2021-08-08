import 'package:flutter/material.dart';

import '../general_purpose_widgets/pure_icon.dart';

class CustomFloatingActionButton extends StatelessWidget {

  @required
  final Function()? onPressed;
  final IconData? iconData;
  final Color? color;
  final double? size;

  const CustomFloatingActionButton({
    Key? key,
    this.onPressed,
    this.iconData,
    this.color,
    this.size,
  }) : assert(iconData !=null, "IconData cannot be null"), super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      onPressed: onPressed,
      child: PureIcon(
        iconData: iconData,
      ),
    );
  }
}
