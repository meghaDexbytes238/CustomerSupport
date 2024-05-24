import 'package:customersupport/config/app_color.dart';
import 'package:customersupport/config/app_string.dart';
import 'package:customersupport/customer_bloc/chat_bloc.dart';
import 'package:customersupport/customer_bloc/chat_event.dart';
import 'package:customersupport/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  TextEditingController textController = TextEditingController();
  ChatBloc bloc = ChatBloc();
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
     body: BlocBuilder(
       bloc: bloc,
       builder: (context, state) {
       return  Padding(
         padding:  EdgeInsets.all(25.sp),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           mainAxisSize: MainAxisSize.max,
           children: [
             Flexible(
               child: Container(
                // color: AppColor.red,
                 child: (bloc.msgList.isEmpty)?  Center(child: Text('${AppString.notMsg}'))
                     :
                 ListView.builder(
                   controller: bloc.controller,
                   itemCount: bloc.msgList.length,
                   itemBuilder: (context, index) {
                     return   bloc.msgList[index].isSender == false ?
                     InkWell(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           CircleAvatar(
                             backgroundColor: AppColor.circleAvtarBg ,
                             child: SvgPicture.asset('assets/images/userIcon.svg'),),
                           Center(
                             child: Container(
                               margin: EdgeInsets.symmetric(
                                   vertical: 5.sp, horizontal: 10.sp),
                               padding: EdgeInsets.symmetric(
                                   horizontal: 10.sp, vertical: 7.sp),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20.sp),
                                   color: AppColor.lightGrey
                               ),
                               child: Widgets.customText(data: bloc.msgList[index].message,fontSize: 15.sp,fontWeight: FontWeight.w500)
                             ),
                           ),
                         ],

                       ),
                       onLongPress: () {
                         Widgets.alert(context: context,
                             actions:
                           [
                             Widgets.popUpActionBtn(text: 'Ok', onTap: () {
                               Navigator.pop(context);
                               bloc.add(ChatDeleteEvent(index: index));
                             }),
                             Widgets.popUpActionBtn(text: 'Cancel', onTap: () {
                               Navigator.pop(context);
                             }),
                           ],
                         );
                       },
                     ):
                     Padding(
                       padding:  EdgeInsets.only(left: 50.sp),
                       child: InkWell(
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Flexible(
                               child: Container(
                                 margin: EdgeInsets.symmetric(
                                     vertical: 5.sp, horizontal: 10.sp),
                                 padding: EdgeInsets.symmetric(
                                     horizontal: 12.sp, vertical: 10.sp),
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20.sp),
                                     color: AppColor.red
                                 ),
                           child: Widgets.customText(data: bloc.msgList[index].message,fontSize: 15.sp,fontWeight: FontWeight.w500,color: AppColor.white)

                               ),
                             ),
                             Container(
                               decoration: BoxDecoration(
                                   image: const DecorationImage(image: AssetImage('assets/images/userImg.png')),
                                   borderRadius: BorderRadius.circular(30.sp),
                                   border: Border.all(width: 2.sp,color: AppColor.red)
                               ),
                               height: 38.sp,
                               width: 38.sp,
                               margin: EdgeInsets.only(top: 5.sp),
                             ),
                           ],
                         ),
                         onLongPress: () {
                           Widgets.alert(
                             context: context,
                             actions:
                             [
                               Widgets.popUpActionBtn(text: 'Ok', onTap: () {
                                 Navigator.pop(context);
                                 bloc.add(ChatDeleteEvent(index: index));
                               }),
                               Widgets.popUpActionBtn(text: 'Cancel', onTap: () {
                                 Navigator.pop(context);
                               }),
                             ],
                           );
                         },
                       ),
                     );
                   },
                 ),
               ),),
             Stack(
               children: [
                 Container(
                   height: (MediaQuery.of(context).viewInsets.bottom == 0) ? 45.sp : 0,
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
                     padding:  EdgeInsets.only(right: 40.sp),
                     child: TextField(
                       maxLines: 2,
                       controller: bloc.textController,
                       decoration: InputDecoration(
                         filled: true,
                         border: InputBorder.none,
                         fillColor: AppColor.white,
                         hintText: 'Type here...',
                         prefixIcon: const Icon(Icons.search),
                       ),
                     ),
                   ),
                 ),
                 Align(
                   alignment: Alignment.bottomRight,
                   child: Widgets.sendBtn(
                     onPressed: () {
                       if(bloc.textController.text.isNotEmpty){
                         bloc.add(ChatSendBtnEvent());
                       }
         bloc.controller.animateTo( bloc.controller.position.maxScrollExtent, duration: Duration(milliseconds: 200), curve: Curves.linear);
                   },)

                 ),
               ],

             ),
           ],
         ),
       );
     },),



     // bottomNavigationBar: TextFormField(),

    );
  }
}

class ChatMessage{
  bool isSender = false;
  String message = "";
  ChatMessage({this.isSender = false, required this.message});
}