import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extensions/context_extension.dart';
import '../texts/title_text.dart';

class EmptyBodyMessageWidget extends StatelessWidget {

  final String? imagePath;
  final String? message;

  const EmptyBodyMessageWidget({
    Key? key,
    @required this.imagePath,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _image = SvgPicture.asset(
      imagePath!,
      height: context.height * 0.40,
      width: context.width * 0.40,
    );

    final _message = TitleText(
      text: message,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
      textColor: Colors.black,
    );

    return Container(
      alignment: Alignment.center,
      height: context.height,
      width: context.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image,
            context.normalHeightSpace,
            _message
          ],
        ),
      ),
    );
  }
}
