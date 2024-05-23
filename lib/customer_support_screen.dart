import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: SvgPicture.asset('assets/images/arrow-left.svg'),),
        actions:  [
          Padding(
          padding: EdgeInsets.only(right: 15),
          child: IconButton(onPressed: () {

          }, icon: SvgPicture.asset('assets/images/right_icon.svg'))
          )



        ],
      ),

    );
  }
}
