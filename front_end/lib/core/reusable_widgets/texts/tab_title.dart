import 'package:flutter/material.dart';

import 'title_text.dart';

class TabTitle extends StatelessWidget {
  final String? title;
  const TabTitle({Key? key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Tab _tab = Tab(
      child: TitleText(
        text: title,
        fontWeight: FontWeight.w600,
      ),
    );

    return _tab;
  }
}
