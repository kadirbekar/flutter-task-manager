import 'package:flutter/material.dart';

import '../../constants/design_constants.dart';
import 'custom_text_button.dart';

class CloseDialogButton extends StatelessWidget {

  const CloseDialogButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return CustomTextButton(
      buttonText: "Close Dialog",
      onPressed: () => Navigator.of(context).pop(),
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.teal),
        minimumSize: MaterialStateProperty.all(Size(_mediaQuery.width - 70, _mediaQuery.height * 0.06)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: DesignConstants.instance.borderRadiusCircular,
          )
        )
      ),
    );
  }
}