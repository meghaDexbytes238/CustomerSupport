
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../config/app_string.dart';
import '../customer_support_screen.dart';
import 'chat_event.dart';
import 'chat_state.dart';


class ChatBloc extends Bloc<ChatEvent,ChatState>{
  List <ChatMessage>msgList = [];
  TextEditingController textController = TextEditingController();
  ScrollController controller = ScrollController();
int index = 0;

  ChatBloc() : super(ChatInitialState()){
    on<ChatEvent>((event, emit){
     emit(ChatInitialState());
      if (event is ChatSendBtnEvent) {
          msgList.add(ChatMessage(message: AppString.defaultMsg, isSender: false));
          msgList.add(ChatMessage(message: textController.text ?? '', isSender: true));
          textController.text = '';
          emit(ChatAddState(chat: textController.text));
           }
      if(event is ChatDeleteEvent){
        index = event.index!;
        msgList.removeAt(index);
        emit(ChatDeleteState(index: event.index));
      }
    });



  }
}