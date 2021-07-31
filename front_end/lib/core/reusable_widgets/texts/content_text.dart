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

    final _textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Tooltip(
      message: text ?? "",
      child: Text(
        text ?? "",
        style: textStyle ?? TextStyle(
          fontSize: fontSize != null ? (fontSize! * _textScaleFactor) : (15 * _textScaleFactor),
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
