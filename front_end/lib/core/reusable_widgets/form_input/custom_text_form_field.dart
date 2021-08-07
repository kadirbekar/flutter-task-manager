import 'package:flutter/material.dart';

import '../../constants/design_constants.dart';

class CustomTextFormField extends StatelessWidget {

  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final int? maxLine;
  final int? maxLenght;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    Key? key,
    @required this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.maxLine,
    this.maxLenght,
    this.textInputAction,
    this.autovalidateMode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _scaleFactor = MediaQuery.of(context).textScaleFactor;

    final _outlineInputBorder = OutlineInputBorder(
      borderRadius: DesignConstants.instance.borderRadiusCircular,
      borderSide: BorderSide(color: Colors.grey),
    );

    return Container(
      width: double.infinity,
      child: TextFormField(
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        validator: validator,
        maxLength: this.maxLenght,
        maxLines: this.maxLine ?? 1,
        textInputAction: textInputAction ?? TextInputAction.done,
        style: TextStyle(
          color: Colors.black,
          fontSize: _scaleFactor * 16.0
        ),
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: _outlineInputBorder,
          prefixIcon: this.prefixIcon,
          hintText: this.hintText,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          border: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
