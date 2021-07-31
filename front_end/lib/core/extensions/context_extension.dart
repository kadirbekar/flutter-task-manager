import 'package:flutter/material.dart';
extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  SizedBox get lowWidthSpace => SizedBox(width: this.width * 0.02);
  SizedBox get normalWidthSpace => SizedBox(width: this.width * 0.04);
  
  SizedBox get lowHeightSpace => SizedBox(height: this.height * 0.02);
  SizedBox get mediumHeightSpace => SizedBox(height: this.height * 0.04);
  SizedBox get normalHeightSpace => SizedBox(height: this.height * 0.06);
}