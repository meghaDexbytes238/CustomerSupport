
import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'config/app_color.dart';

abstract class Widgets{
  static Widget customText(
      {required String data,
        double? fontSize,
        String? fontFamily,
        FontWeight? fontWeight,
        TextAlign? textAlign,Color? color}) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize ?? 10,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: fontFamily ?? 'Roboto',
          color: color ?? AppColor.black
      ),
    );

  }}
