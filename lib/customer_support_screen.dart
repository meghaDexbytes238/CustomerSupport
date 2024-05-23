import 'package:customersupport/config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  TextEditingController textController = TextEditingController();
  List <String>tags = [];
  // void addTag() {
  //   setState(() {
  //     dynamicList.add(tagPreview(tagController.text));
  //     tags.add(tagController.text);
  //     tagController.clear();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: SvgPicture.asset('assets/images/arrow-left.svg'),),
        actions:  [
          Padding(
          padding: EdgeInsets.only(right: 15.sp),
          child: IconButton(onPressed: () {
          }, icon: SvgPicture.asset('assets/images/right_icon.svg'))
          )

        ],
      ),
     body: Padding(
       padding:  EdgeInsets.all(25.sp),
       child: Column(
         children: [
           Expanded(
             child: Container(
               color: AppColor.white,
                 child: (tags.isEmpty)? const Center(child: Text('No message'))
                     : ListView.builder(
                   itemCount: tags.length,
                   itemBuilder: (context, index) {
                     return  Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Center(
                           child: Container(
                             margin: EdgeInsets.symmetric(
                                 vertical: 5, horizontal: 10),
                             padding: EdgeInsets.symmetric(
                                 horizontal: 10, vertical: 7),
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 color: Colors.green),
                             child: Text(tags[index]),
                           ),
                         ),
                       ],
                     );
                       //Text(tags[index]);
                   },
                 ),
       ),

               // Center(
               //   child: Text('This is your home page'), // body: SingleChildScrollView(...)
               // ),
             ),
           Stack(
        children: [
           Container(
            height: 50.sp,
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
              //color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: TextField(
                maxLines: 2,
                 controller: textController,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: AppColor.white,
                  hintText: 'Type here...',
                  prefixIcon: const Icon(Icons.search),
                ),

                // onChanged: (value) {
                //   setState(() {
                //     tags.add(textController.text);
                //     print('value msg : $tags');
                //   });
                // },
                // onChanged: onChanged
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 50.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.sp))
              ),
              child: IconButton.filledTonal(
                onPressed: () {
                 setState(() {
                   tags.add(textController.text);
                   //addTag();
                   print(" tag list : $tags");
                 });

                },
                icon:  SvgPicture.asset('assets/images/paper-plane.svg'),
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  backgroundColor: MaterialStatePropertyAll(AppColor.red),
                ),
              ),
            ),
          ),
        ],

           ),
         ],
       ),
     ),
     // bottomNavigationBar: TextFormField(),

    );
  }
}
