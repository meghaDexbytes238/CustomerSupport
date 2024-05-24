abstract class ChatEvent{
  ChatEvent();
}
class ChatSendBtnEvent extends ChatEvent{
  ChatSendBtnEvent();
}
class ChatDeleteEvent extends ChatEvent{
  int? index;
  ChatDeleteEvent({required this.index,});
}

