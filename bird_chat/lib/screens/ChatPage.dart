import 'dart:math';

import 'package:bird_chat/models/events.dart';
import 'package:bird_chat/screens/GroupInfoPage.dart';
import 'package:bird_chat/services/MessagesController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bird_chat/models/Message.dart';

class ChatPage extends StatelessWidget {
  static const String route = "/chat";

  final Event event;
  final MessagesController controller;

  ChatPage({this.event, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, GroupInfoPage.route, arguments: event);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          MessageList(controller),
          ChatForm(controller),
        ],
      ),
    );
  }
}

class ChatForm extends StatefulWidget {

  MessagesController controller;
  ChatForm(MessagesController controller) {
    this.controller = controller;
  }

  @override
  _ChatFormState createState() => _ChatFormState();
}

class _ChatFormState extends State<ChatForm> {
  final textController = new TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    
    super.dispose();
  }

  Widget drawTextField() {
    return Flexible(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.all(10),
        ),
        controller: this.textController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          drawTextField(),
          FloatingActionButton(
            mini: true,
            clipBehavior: Clip.antiAlias,
            child: Icon(Icons.send),
            onPressed: _submit,
          )
        ],
      ),
      padding: EdgeInsets.all(5),
      color: Theme.of(context).backgroundColor,
    );
  }

  void _submit() {
    String text = textController.text;

    widget.controller.addMessage(Message(
      key: "0",
      name: "0",
      text: text,
      timestamp: new DateTime.now().millisecondsSinceEpoch,
    ));
    textController.clear();

    return;
  }
}

class MessageList extends StatefulWidget {

  MessagesController controller;

  MessageList(MessagesController controller) {
    this.controller = controller;
  }

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final scrollController = new ScrollController();
  
  final lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";

  List<Message> messages = <Message>[];
  String idUser = "0";

  @override
  void initState() {
    super.initState();

    print("${widget.controller.event.id}");
    widget.controller.updateFunction = (msgs) {
      setState(() {
        print("updated");
        messages = msgs;
      });
    };
    print("${widget.controller.updateFunction}");
    widget.controller.getMessages();
  }

  Widget _buildMessageCard(int i, Message msg) {

    bool ownMessage = msg.key == idUser;

    String username = msg.key == idUser ? "You" : "${msg.name} ${msg.key}";

    Widget userTitle = Container(
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    Color msgBg = ownMessage ? Theme.of(context).backgroundColor.withAlpha(190) : Color.fromRGBO(1, 1, 1, 0.05);

    Widget textContainer = Container(
      decoration: BoxDecoration(
        color: msgBg,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Text("${msg.text}"),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userTitle,
          textContainer
        ],
      ),
    );
  }

  void _populateMessages() {
    for (int i = 0; i < 10; i++) {
      int id = Random().nextInt(10);
      messages.add(new Message(
        key: "$id",
        name: "user",
        text: lorem,
        timestamp: 0
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.vertical,
        reverse: true,
        padding: EdgeInsets.all(5),
        itemCount: messages.length,
        itemBuilder: (context, i) {
          //if (i >= messages.length) {
          //  _populateMessages();
          //}

          return _buildMessageCard(i, messages[i]);
        },
      ),
    );
  }
}
