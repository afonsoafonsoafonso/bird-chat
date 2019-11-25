import 'dart:collection';

import 'package:bird_chat/models/Message.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/screens/ChatPage.dart';

class MessagesController {

  Event event;
  SplayTreeSet<Message> messages = SplayTreeSet<Message>(); 

  void Function(List<Message>) updateFunction;

  MessagesController({this.event}) {
    
  }

  void getMessages() {
    updateFunction(messages.toList());
  }

  void addMessage(Message msg) {
    messages.add(msg);

    updateFunction(messages.toList());
  }
}