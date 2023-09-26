import 'package:flutter/cupertino.dart';

class SizeConfig {
  static MediaQueryData? mediaQueryData;
  static double? screenW;
  static double? screenH;
  static double? blockH;
  static double? blockV;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenW = mediaQueryData!.size.width;
    screenH = mediaQueryData!.size.height;
    blockH = screenW! / 100;
    blockV = screenH! / 100;
  }
}
