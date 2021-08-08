import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {

  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const TitleText({
    Key? key,
    @required this.text,
    this.textColor,
    this.textStyle,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _textScaleFactor = MediaQuery.of(context).textScaleFactor;

    final TextStyle _textStyle = TextStyle(
          fontSize: fontSize != null ? (fontSize! * _textScaleFactor) : (17 * _textScaleFactor),
          color: textColor ?? Colors.white,
          fontWeight: fontWeight ?? FontWeight.normal
        );

    final _tooltip = Tooltip(
      message: text ?? "",
      child: Text(
        text ?? "",
        style: textStyle ?? _textStyle,
        textAlign: textAlign ?? TextAlign.left,
      ),
    );

    return _tooltip;
  }
}
