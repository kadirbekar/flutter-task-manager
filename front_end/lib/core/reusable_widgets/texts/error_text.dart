import 'package:flutter/material.dart';

import 'title_text.dart';

class CustomErrorText extends StatelessWidget {
  const CustomErrorText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: TitleText(text: "Error"),);
  }
}
