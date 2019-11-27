import 'dart:collection';

import 'package:bird_chat/models/Message.dart';
import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/services/DatabaseMock.dart';

class MessagesController {

  Event event;
  SplayTreeSet<Message> messages = SplayTreeSet<Message>(); 

  void Function(List<Message>) updateFunction;

  MessagesController({this.event}) {
    messages.addAll(DatabaseMock.getMessages(this.event.id));
  }

  void getMessages() {
    updateFunction(messages.toList());
  }

  void addMessage(Message msg) {
    print(msg.text);
    messages.add(msg);

    updateFunction(messages.toList());
  }
}