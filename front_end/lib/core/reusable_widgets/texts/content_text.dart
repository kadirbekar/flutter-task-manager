import 'package:flutter/material.dart';

class ContentText extends StatelessWidget {

  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;

  const ContentText({
    Key? key,
    @required this.text,
    this.textColor = Colors.black,
    this.textStyle,
    this.fontSize,
    this.fontWeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final _textStyle = TextStyle(
          fontSize: fontSize != null ? (fontSize! * _textScaleFactor) : (15 * _textScaleFactor),
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
        );

    final Tooltip _tooltip = Tooltip(
      message: text ?? "",
      child: Text(
        text ?? "",
        style: textStyle ?? _textStyle,
      ),
    );

    return _tooltip;
  }
}
