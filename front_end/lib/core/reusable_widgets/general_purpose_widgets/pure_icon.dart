import 'package:flutter/material.dart';

class PureIcon extends StatelessWidget {

  final IconData? iconData;
  final Color? color;
  final double? size;

  const PureIcon({
    Key? key,
    @required this.iconData,
    this.color,
    this.size,
  })  : assert(iconData != null, "IconData cannot be null"),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    final Icon _icon = Icon(
      iconData,
      size: size ?? 35,
      color: color ?? Colors.white,
    );

    return _icon;
  }
}
