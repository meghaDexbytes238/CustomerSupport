import 'dart:ui';

import 'package:customersupport/config/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle{
  static  TextStyle titleStyle(
       {Color? texColor,
         double? fontSize,
         fontFamily,
         fontWeight}) =>
       TextStyle(
         color: AppColor.white,
         fontFamily: 'Lobster',
         fontSize: 60.sp
       );
           //color: texColor ?? AppColors.textNormalColor1,
           // fontSize: fontSize ?? 14.5,
           // fontFamily: fontFamily ?? 'Roboto',);

}