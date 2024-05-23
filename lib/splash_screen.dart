import 'package:customersupport/config/app_color.dart';
import 'package:customersupport/config/app_string.dart';
import 'package:customersupport/customer_support_screen.dart';
import 'package:customersupport/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSupportScreen(),));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.gredientTop,
              AppColor.red,
              AppColor.red,
            ],
          ),
        ),
        child:  Stack(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,

                child: Image(image: AssetImage('assets/images/burgerFirst.png'))),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 90.sp),
                  child: Image(image: AssetImage('assets/images/burgerSecond.png')),
                )),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 260.sp),
                child: Widgets.customText(data: AppString.projectName,fontSize: 60.sp,fontFamily: 'Lobster',color: AppColor.white),
              ),
            )
        
          ],
        ),

      ),

    );
  }
}
