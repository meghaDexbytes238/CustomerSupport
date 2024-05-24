
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
          fontSize: fontSize ?? 10.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: fontFamily ?? 'Roboto',
          color: color ?? AppColor.black
      ),
    );

  }
static Widget sendBtn({required void Function()? onPressed}){
    return   Container(
      width: 45.sp,
      height: 45.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.sp))
      ),
      child: IconButton.filledTonal(

        // onPressed: () {
        //   bloc.add(ChatSendBtnEvent());
        // },
        icon:  SvgPicture.asset('assets/images/paper-plane.svg'),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStatePropertyAll(AppColor.red),
        ), onPressed: onPressed,
      ),
    );

}
static Widget textField({required  TextEditingController? controller}){
    return Container(
      height: 45.sp,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5.sp), //color of shadow
            blurRadius: 7,
            offset: const Offset(0, 1),
          ),
        ],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: TextField(
          maxLines: 10,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            border: InputBorder.none,
            fillColor: AppColor.white,
            hintText: 'Type here...',
          ),
        ),
      ),
    );
}
static GestureDetector popUpActionBtn({required String text, required void Function()? onTap }){
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.sp,
        height: 50.sp,
        decoration: BoxDecoration(
            color: AppColor.red,
            borderRadius: BorderRadius.all(Radius.circular(15.sp))
        ),
        child:  Center(child: customText(data: text,fontWeight: FontWeight.w600,color: AppColor.white, fontSize: 16.sp)
        ),
      ),

    );
}
static Future alert({required BuildContext context,  List<Widget>? actions}){
    return   showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        alignment: Alignment.center,
        elevation: 20.sp,
        title: Widgets.customText(data: 'Confirm Alert',color: AppColor.red,fontWeight: FontWeight.w700, fontSize: 30.sp,fontFamily: 'Poppins',textAlign: TextAlign.center),
        content:  Widgets.customText(data: 'Are you sure you want to delete this message?',color: AppColor.popuptextclrContent,fontWeight: FontWeight.w400, fontSize: 14.sp,textAlign: TextAlign.center),
        actions: actions,
        shadowColor: AppColor.black,
        // [
        //   Widgets.popUpActionBtn(text: 'Ok', onTap: () {
        //     Navigator.pop(context);
        //     bloc.add(ChatDeleteEvent(index: index));
        //   }),
        //   Widgets.popUpActionBtn(text: 'Cancel', onTap: () {
        //     Navigator.pop(context);
        //   }),
        // ],
      ),
    );
}




}
