import 'package:flutter/material.dart';
import 'package:getx_nodejs_task_manager/core/constants/design_constants.dart';

import '../texts/title_text.dart';

class CustomTextButton extends StatelessWidget {

  final String? buttonText;
  final Color? buttonBackgroundColor;
  final Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final Color? textColor;
  final EdgeInsets? edgeInsets;

  const CustomTextButton(
  { Key? key,
    @required this.buttonText,
    this.buttonBackgroundColor,
    this.onPressed,
    this.buttonStyle,
    this.textColor,
    this.edgeInsets
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: edgeInsets ?? const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onPressed,
        child: TitleText(
          text: buttonText,
          textColor: textColor ?? Colors.white,
        ),
        style: buttonStyle ?? ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonBackgroundColor ?? Colors.orange,
            ),
            minimumSize: MaterialStateProperty.all(Size(
                _mediaQuery.width,
                _mediaQuery.height * 0.06,
              ),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: DesignConstants.instance.borderRadiusCircular,
              )
            )
          ),
      ),
    );
  }
}
