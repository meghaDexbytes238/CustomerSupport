
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/app_string.dart';
import '../customer_support_screen.dart';
import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent,ChatState>{

  ChatBloc() : super(ChatInitialState()){
    //if( textController.text.isNotEmpty)
    // on<ChatSendBtnEvent>((event, emit) {
    //   msgList.add(ChatMessage(message: AppString.defaultMsg, isSender: false));
    //   msgList.add(
    //       ChatMessage(message: textController.text ?? '', isSender: true));
    //   textController.text = '';
    //   // controller.animateTo(
    //   //   controller.position.maxScrollExtent,
    //   //   duration: Duration(milliseconds: 500),
    //   //   curve: Curves.fastOutSlowIn,
    //   // );
    //   print('list :$msgList');
    //   emit(ChatAddState(chat: textController.text));
    // });
    on<ChatEvent>((event, emit){
     emit(ChatInitialState());
      if (event is ChatSendBtnEvent) {
           }
      if(event is ChatDeleteEvent){

      }
    });



  }
}